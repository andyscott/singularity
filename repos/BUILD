load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

_universe_build_labels = [
    "@com_chuusai_shapeless",
    "@com_github_mpilquist_simulacrum",
    "@eu_timepit_refined//:core",
    "@io_circe_circe//:generic",
    "@io_circe_circe//:numbers",
    "@io_circe_circe//:shapes",
    "@org_scalacheck_scalacheck",
    "@org_scalamacros_paradise",
    "@org_scalamacros_paradise//:test",
    "@org_scalatest_scalatest",
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
    "@com_chuusai_shapeless//:test_suite",
    "@com_github_mpilquist_simulacrum//:test_suite",
    "@eu_timepit_refined//:test_suite",
    "@org_spire_math_kind_projector//:test_suite",
    "@org_typelevel_macro_compat//:test_suite",
    "@org_scalatest_scalatest//:test_suite",
]

test_suite(
    name = "test_suite",
    tests = _universe_test_labels,
)

load(":stats.bzl", "collect_srcs_test")

collect_srcs_test(
    name = "cloc",
    deps = [
        ":build",
        ":test_suite",
    ],
)
