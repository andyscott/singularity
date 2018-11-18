load("//repos:rules.bzl", "overlaid_github_repository")

def org_typelevel_machinist_repository():
    overlaid_github_repository(
        name = "org_typelevel_machinist",
        path = "org/typelevel/machinist",
        repo = "typelevel/machinist",
        sha = "ceb2f0a697d60d962f9f4f1ef84d306582d959e1",
    )
