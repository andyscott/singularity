load("//repos:rules.bzl", "overlaid_github_repository")

def org_scalatest_scalatest_repository():
    overlaid_github_repository(
        name = "org_scalatest_scalatest_src",
        path = "org/scalatest/scalatest",
        repo = "scalatest/scalatest",
        sha = "78e506537ed06d4438e1d365e18c160d46d2bf18",
    )
