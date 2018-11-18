load("//repos:rules.bzl", "overlaid_github_repository")

def org_typelevel_cats_repository():
    overlaid_github_repository(
        name = "org_typelevel_cats",
        path = "org/typelevel/cats",
        repo = "typelevel/cats",
        sha = "533cc16e4f5bc45f84ac5cae1a6bfca4c007c5e0",
    )
