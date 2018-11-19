load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

_universe_build_labels = [
    "@com_chuusai_shapeless",
    "@com_github_mpilquist_simulacrum",
    "@io_circe_circe//:generic",
    "@io_circe_circe//:numbers",
    "@io_circe_circe//:shapes",
    "@org_scalacheck_scalacheck",
    "@org_scalamacros_paradise",
    "@org_scalamacros_paradise//:test",
    "@org_scalatest_scalatest//:scalactic",
    "@org_spire_math_kind_projector",
    "@org_typelevel_cats//:core",
    "@org_typelevel_cats//:kernel",
    "@org_typelevel_machinist",
    "@org_typelevel_machinist//:example",
    "@org_typelevel_macro_compat",
]

filegroup(
    name = "build",
    data = _universe_build_labels,
)

_universe_test_labels = [
    "@com_chuusai_shapeless//:test",
    "@com_github_mpilquist_simulacrum//:test",
    "@org_spire_math_kind_projector//:test",
    "@org_typelevel_macro_compat//:test",
    "@org_scalatest_scalatest//:scalactic_test",
]

test_suite(
    name = "test",
    tests = _universe_test_labels,
)

load(":stats.bzl", "collect_srcs_test")

collect_srcs_test(
    name = "cloc",
    deps = [
        ":build",
        ":test",
    ],
)
