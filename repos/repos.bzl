load("@rules_scala_annex//rules:external.bzl", "scala_maven_import_external")
load("//repos:rules.bzl", "overlaid_github_repository")

def singularity_scala_repositories():
    com_chuusai_shapeless_repository()
    com_github_mpilquist_simulacrum_repository()
    io_circe_circe_repository()
    org_scalacheck_scalacheck_repository()
    org_scalamacros_paradise_repository()
    org_scalatest_scalatest_repository()
    org_spire_math_kind_projector_repository()
    org_typelevel_cats_repository()
    org_typelevel_machinist_repository()
    org_typelevel_macro_compat_repository()

    scala_binary_dependencies_must_burn()
    java_binary_dependencies_might_burn()

def com_chuusai_shapeless_repository():
    overlaid_github_repository(
        name = "com_chuusai_shapeless",
        path = "com/chuusai/shapeless",
        repo = "milessabin/shapeless",
        sha = "1185bc22692bd5c085b158b732c931d1091c5c62",
    )

def com_github_mpilquist_simulacrum_repository():
    overlaid_github_repository(
        name = "com_github_mpilquist_simulacrum",
        path = "com/github/mpilquist/simulacrum",
        repo = "mpilquist/simulacrum",
        sha = "71021d1bba7c2181dba4358fa3b73785b1a2c273",
    )

def io_circe_circe_repository():
    overlaid_github_repository(
        name = "io_circe_circe",
        path = "io/circe/circe",
        repo = "circe/circe",
        sha = "686bb1043ec5b3250c63f059fa978f9560dd24a8",
    )

def org_scalacheck_scalacheck_repository():
    overlaid_github_repository(
        name = "org_scalacheck_scalacheck",
        path = "org/scalacheck/scalacheck",
        repo = "rickynils/scalacheck",
        sha = "7a83b03cb5df9b9cc4e10d3c0a75847f2c0c6b74",
    )

def org_scalamacros_paradise_repository():
    overlaid_github_repository(
        name = "org_scalamacros_paradise",
        path = "org/scalamacros/paradise",
        repo = "scalamacros/paradise",
        sha = "66f5b66e5fc7e221e225dfe65e4ed1dc41276821",  # tag 2.12.7
    )

def org_scalatest_scalatest_repository():
    overlaid_github_repository(
        name = "org_scalatest_scalatest",
        path = "org/scalatest/scalatest",
        repo = "scalatest/scalatest",
        sha = "78e506537ed06d4438e1d365e18c160d46d2bf18",
    )

def org_spire_math_kind_projector_repository():
    overlaid_github_repository(
        name = "org_spire_math_kind_projector",
        path = "org/spire_math/kind_projector",
        repo = "non/kind-projector",
        sha = "c956b9451c584d743a29247331be4d4b76ea5ccd",
    )

def org_typelevel_cats_repository():
    overlaid_github_repository(
        name = "org_typelevel_cats",
        path = "org/typelevel/cats",
        repo = "typelevel/cats",
        sha = "533cc16e4f5bc45f84ac5cae1a6bfca4c007c5e0",
    )

def org_typelevel_machinist_repository():
    overlaid_github_repository(
        name = "org_typelevel_machinist",
        path = "org/typelevel/machinist",
        repo = "typelevel/machinist",
        sha = "ceb2f0a697d60d962f9f4f1ef84d306582d959e1",
    )

def org_typelevel_macro_compat_repository():
    overlaid_github_repository(
        name = "org_typelevel_macro_compat",
        path = "org/typelevel/macro_compat",
        repo = "milessabin/macro-compat",
        sha = "e9b9a94762ee2a43364e4cc6f24083030937576d",
    )

# Everything in here should be burned away
def scala_binary_dependencies_must_burn():
    native.maven_jar(
        name = "org_scala_lang_modules_scala_parser_combinators",
        artifact = "org.scala-lang.modules:scala-parser-combinators_2.12:1.1.1",
        sha1 = "29b4158f9ddcc22d1c81363fd61a8bef046f06b9",
    )

    native.maven_jar(
        name = "org_scala_lang_modules_scala_xml",
        artifact = "org.scala-lang.modules:scala-xml_2.12:1.1.1",
        sha1 = "f56ecaf2e5b7138c87449303c763fd1654543fde",
    )

def java_binary_dependencies_might_burn():
    native.maven_jar(
        name = "junit",
        artifact = "junit:junit:4.12",
        sha1 = "2973d150c0dc1fefe998f834810d68f278ea58ec",
    )

    native.maven_jar(
        name = "hamcrest_core",
        artifact = "org.hamcrest:hamcrest-core:1.3",
        sha1 = "42a25dc3219429f0e5d060061f71acb49bf010a0",
    )

    native.maven_jar(
        name = "junit_interface",
        artifact = "com.novocode:junit-interface:jar:0.11",
        sha1 = "38bb853c93abfbe14a0514016f0f70dd73422d9f",
    )

    native.maven_jar(
        name = "antlr",
        artifact = "antlr:antlr:2.7.7",
        sha1 = "83cd2cd674a217ade95a4bb83a8a14f351f48bd0",
    )

    native.maven_jar(
        name = "antlr_stringtemplate",
        artifact = "org.antlr:stringtemplate:3.2",
        sha1 = "6fe2e3bb57daebd1555494818909f9664376dd6c",
    )
