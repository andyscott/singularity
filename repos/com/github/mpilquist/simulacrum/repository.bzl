load("//repos:rules.bzl", "overlaid_github_repository")

def com_github_mpilquist_simulacrum_repository():
    overlaid_github_repository(
        name = "com_github_mpilquist_simulacrum",
        path = "com/github/mpilquist/simulacrum",
        repo = "mpilquist/simulacrum",
        sha = "71021d1bba7c2181dba4358fa3b73785b1a2c273",
    )
