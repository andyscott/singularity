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
            srcs = srcs + [src for src in dep[CollectedSrcs].srcs]

    # TODO: we should unzip srcjars so they are counted!

    ctx.actions.run_shell(
        inputs = srcs,
        outputs = [ctx.outputs.out],
        progress_message = "Wooting",
        command = "cloc %s > %s" % (" ".join([src.path for src in srcs]), ctx.outputs.out.path),
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
