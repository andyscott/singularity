load("//repos:rules.bzl", "overlaid_github_repository")

def org_typelevel_macro_compat_repository():
    overlaid_github_repository(
        name = "org_typelevel_macro_compat",
        path = "org/typelevel/macro_compat",
        repo = "typelevel/macro-compat",
        sha = "e9b9a94762ee2a43364e4cc6f24083030937576d",
    )
