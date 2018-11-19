def _execute(ctx, *args, quiet = False):
    return ctx.execute(["bash", "-c", """
set -ex
%s""" % "\n".join(args)], quiet = quiet)

def _overlaid_github_repository_implementation(ctx):
    contents = """exports_files(glob(["**/*.overlay"]))"""

    repos_build = ctx.path(Label("//repos:BUILD"))
    path = ctx.attr.path

    url = "https://github.com/%s/archive/%s.tar.gz" % (ctx.attr.repo, ctx.attr.sha)
    print("L222")
    _execute(
        ctx,
        "wget -qO- \"%s\" | tar xvz --strip 1" % url,
        "ROOT=$(pwd)",
        "pushd $(dirname %s)/%s" % (repos_build, path),
        "find . -name '*' -print | cpio -pavd $ROOT",
        "popd",
    )

overlaid_github_repository = repository_rule(
    attrs = {
        "repo": attr.string(),
        "sha": attr.string(),
        "path": attr.string(),
    },
    implementation = _overlaid_github_repository_implementation,
)
