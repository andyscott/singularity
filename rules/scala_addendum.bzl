load("@bazel_skylib//lib:dicts.bzl", _dicts = "dicts")

def _make_srcjar_implementation(ctx):
    ctx.actions.run_shell(
        tools = [ctx.executable._zipper, ctx.executable.generator],
        inputs = ctx.files.data,
        outputs = [ctx.outputs.srcjar],
        progress_message = "Generating sources for %s" % ctx.label.name,
        command = "\n".join(
            ["mkdir -p $(dirname %s)" % file.owner.name for file in ctx.files.data] +
            ["cp %s %s" % (file.path, file.owner.name) for file in ctx.files.data] +
            ["./%s" % ctx.executable.generator.path] +
            ["rm %s" % file.owner.name for file in ctx.files.data] +
            ["./%s c %s $(find . -type f)" % (ctx.executable._zipper.path, ctx.outputs.srcjar.path)],
        ),
    )

_make_srcjar_private_attributes = {
    "_zipper": attr.label(
        cfg = "host",
        default = "@bazel_tools//tools/zip:zipper",
        executable = True,
    ),
}

make_srcjar = rule(
    attrs = _dicts.add(
        _make_srcjar_private_attributes,
        {
            "generator": attr.label(
                cfg = "host",
                executable = True,
            ),
            "data": attr.label_list(
                allow_files = True,
                cfg = "data",
            ),
        },
    ),
    doc = "Makes a srcjar by running a binary",
    outputs = {
        "srcjar": "%{name}.srcjar",
    },
    toolchains = [
        "@rules_scala_annex//rules/scala:deps_toolchain_type",
        "@rules_scala_annex//rules/scala:runner_toolchain_type",
    ],
    implementation = _make_srcjar_implementation,
)
