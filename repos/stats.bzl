CollectedSrcs = provider(
    fields = {
        "srcs": "the actual files",
    },
)

_attr_aspects = [
    "deps",
    "data",
    "tests",
]

def _collect_srcs_aspect_impl(target, ctx):
    srcs = []

    if hasattr(ctx.rule.attr, "srcs"):
        srcs = depset(transitive = [src.files for src in ctx.rule.attr.srcs]).to_list()

    for attr in _attr_aspects:
        if hasattr(ctx.rule.attr, attr):
            for entry in getattr(ctx.rule.attr, attr):
                srcs = srcs + entry[CollectedSrcs].srcs

    return [CollectedSrcs(srcs = srcs)]

collect_srcs_aspect = aspect(
    attr_aspects = _attr_aspects,
    implementation = _collect_srcs_aspect_impl,
)

def _collect_srcs_rule_impl(ctx):
    srcs = []
    if hasattr(ctx.attr, "deps"):
        for dep in ctx.attr.deps:
            srcs = srcs + [f for f in dep[CollectedSrcs].srcs]

    inputs = []

    for src in srcs:
        if src.extension in ["srcjar", "jar"]:
            # take advantage of the fact that cloc will
            # look into .zip files automatically
            # update: not sure if this is actually working!
            srcjar = ctx.actions.declare_file("%s_%s.zip" % (hash(src.short_path), src.basename))
            ctx.actions.run_shell(
                inputs = [src],
                outputs = [srcjar],
                command = "cp %s %s" % (src.path, srcjar.path),
            )
            inputs = inputs + [srcjar]
        else:
            inputs = inputs + [src]

    file = ctx.actions.declare_file("source_file_list.txt")
    ctx.actions.write(file, "\n".join([f.path for f in inputs]))

    ctx.actions.run_shell(
        inputs = inputs + [file],
        outputs = [ctx.outputs.out],
        progress_message = "Counting lines of code...",
        command = "cloc --list-file=%s > %s" % (file.path, ctx.outputs.out.path),
    )

    ctx.actions.write(ctx.outputs.executable, "cat %s" % ctx.outputs.out.short_path, True)
    return [DefaultInfo(runfiles = ctx.runfiles(files = [ctx.outputs.out]))]

collect_srcs_test = rule(
    attrs = {
        "deps": attr.label_list(aspects = [collect_srcs_aspect]),
    },
    outputs = {"out": "%{name}.txt"},
    test = True,
    implementation = _collect_srcs_rule_impl,
)
