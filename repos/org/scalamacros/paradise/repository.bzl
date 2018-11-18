load("//repos:rules.bzl", "overlaid_github_repository")

def org_scalamacros_paradise_repository():
    overlaid_github_repository(
        name = "org_scalamacros_paradise",
        path = "org/scalamacros/paradise",
        repo = "scalamacros/paradise",
        sha = "66f5b66e5fc7e221e225dfe65e4ed1dc41276821",  # tag 2.12.7
    )
