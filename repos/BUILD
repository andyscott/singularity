load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

_universe_build_labels = [
    "@com_github_mpilquist_simulacrum",
    "@com_github_mpilquist_simulacrum//:test_compile",
    "@org_typelevel_cats//:kernel",
    "@org_typelevel_cats//:core",
    "@org_typelevel_machinist",
    "@org_typelevel_machinist//:example",
    "@org_typelevel_macro_compat",
    "@org_scalamacros_paradise",
]

filegroup(
    name = "build",
    data = _universe_build_labels,
)

_universe_test_labels = [
    "@org_typelevel_macro_compat//:test",
    "@org_scalamacros_paradise//:test",
]

test_suite(
    name = "test",
    tests = _universe_test_labels,
)
