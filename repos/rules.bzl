def _execute(ctx, *args, quiet = False):
    return ctx.execute(["bash", "-c", """
set -ex
%s""" % "\n".join(args)], quiet = quiet)

def _overlaid_github_repository_implementation(ctx):
    contents = """exports_files(glob(["**/*.overlay"]))"""

    repos_build = ctx.path(Label("//repos:BUILD"))
    path = ctx.attr.path

    url = "https://github.com/%s/archive/%s.tar.gz" % (ctx.attr.repo, ctx.attr.sha)

    _execute(
        ctx,
        "SW=$(dirname $(dirname %s))" % repos_build,
        "dir=\"$SW/.github_cache/%s\"" % ctx.attr.repo,
        "file=\"$dir/%s.tar.gz\"" % ctx.attr.sha,
        "mkdir -p \"$dir\"",
        "if [ ! -f \"$file\" ]; then",
        "  wget -qO- \"%s\" > \"$file\"" % url,
        "fi",
        "cat \"$file\" | tar xvz --strip 1",
        "ROOT=$(pwd)",
        "pushd $(dirname %s)/%s" % (repos_build, path),
        "find . -name '*' -print | cpio -pavd $ROOT",
        "popd",
        quiet = True,
    )

overlaid_github_repository = repository_rule(
    attrs = {
        "repo": attr.string(),
        "sha": attr.string(),
        "path": attr.string(),
    },
    environ = [
        "__EVENT_HORIZON__",
    ],
    implementation = _overlaid_github_repository_implementation,
)
