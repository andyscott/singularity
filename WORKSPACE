workspace(name = "io_higherkindness_singularity")

http_archive(
    name = "bazel_skylib",
    sha256 = "c0289fef5237c31e8462042b4cc3bdf831a3d3d135bb4a0d493a5072acecb074",
    strip_prefix = "bazel-skylib-2169ae1c374aab4a09aa90e65efe1a3aad4e279b",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/2169ae1c374aab4a09aa90e65efe1a3aad4e279b.zip"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "2c8f8614fb1be709d68abaab6b4791682aa7db2048012dd4642d3a50b4f67cb3",
    strip_prefix = "protobuf-0038ff49af882463c2af9049356eed7df45c3e8e",
    urls = ["https://github.com/google/protobuf/archive/0038ff49af882463c2af9049356eed7df45c3e8e.zip"],
)

git_repository(
    name = "rules_scala_annex",
    commit = "508c0d51f2ea4ef7af7084e39f465e2faa3a9d1a",
    remote = "git://github.com/andyscott/rules_scala_annex",
)

load("@rules_scala_annex//rules/scala:workspace.bzl", "scala_register_toolchains", "scala_repositories", "scala_repository")

scala_repositories()

scala_register_toolchains()

scala_repository(
    "scala",
    ("org.scala-lang", "2.12.7"),
    "@compiler_bridge_2_12//:src",
)

load("//repos:org/scalamacros/paradise/repository.bzl", "org_scalamacros_paradise_repository")

org_scalamacros_paradise_repository()

load("//repos:org/typelevel/cats/repository.bzl", "org_typelevel_cats_repository")

org_typelevel_cats_repository()

load("//repos:org/typelevel/machinist/repository.bzl", "org_typelevel_machinist_repository")

org_typelevel_machinist_repository()

load("//repos:org/typelevel/macro_compat/repository.bzl", "org_typelevel_macro_compat_repository")

org_typelevel_macro_compat_repository()

load("//repos:com/github/mpilquist/simulacrum/repository.bzl", "com_github_mpilquist_simulacrum_repository")

com_github_mpilquist_simulacrum_repository()

load("//repos:org/scalatest/scalatest/repository.bzl", "org_scalatest_scalatest_repository")

org_scalatest_scalatest_repository()

# TODO area!
# build these from source too

maven_jar(
    name = "kind_projector_2_12",
    artifact = "org.spire-math:kind-projector_2.12:0.9.6",
)

maven_jar(
    name = "junit",
    artifact = "junit:junit:4.12",
    sha1 = "2973d150c0dc1fefe998f834810d68f278ea58ec",
)

maven_jar(
    name = "hamcrest_core",
    artifact = "org.hamcrest:hamcrest-core:1.3",
    sha1 = "42a25dc3219429f0e5d060061f71acb49bf010a0",
)

maven_jar(
    name = "junit_interface",
    artifact = "com.novocode:junit-interface:jar:0.11",
    sha1 = "38bb853c93abfbe14a0514016f0f70dd73422d9f",
)

maven_jar(
    name = "antlr",
    artifact = "antlr:antlr:2.7.7",
    sha1 = "83cd2cd674a217ade95a4bb83a8a14f351f48bd0",
)

maven_jar(
    name = "antlr_stringtemplate",
    artifact = "org.antlr:stringtemplate:3.2",
    sha1 = "6fe2e3bb57daebd1555494818909f9664376dd6c",
)

maven_jar(
    name = "org_scala_lang_modules_scala_parser_combinators",
    artifact = "org.scala-lang.modules:scala-parser-combinators_2.12:1.1.1",
    sha1 = "29b4158f9ddcc22d1c81363fd61a8bef046f06b9",
)

maven_jar(
    name = "org_scala_lang_modules_scala_xml",
    artifact = "org.scala-lang.modules:scala-xml_2.12:1.1.1",
    sha1 = "f56ecaf2e5b7138c87449303c763fd1654543fde",
)

load("@rules_scala_annex//rules:external.bzl", "scala_maven_import_external")

scala_maven_import_external(
    name = "org_scalactic_scalactic",
    artifact = "org.scalactic:scalactic_2.12:3.0.4",
    jar_sha256 = "9b28aa46faaa666a8a10a5173fb72975d59c363c31c3e5f6a27eacc2e654cdfa",
    licenses = ["notice"],
    server_urls = ["http://central.maven.org/maven2/"],
)

scala_maven_import_external(
    name = "org_scalatest_scalatest",
    artifact = "org.scalatest:scalatest_2.12:3.0.4",
    jar_sha256 = "cf2a7999681567e0f0e0166756356ae4ab0cd6c83f3f1d70225d25bb87d26070",
    licenses = ["notice"],
    server_urls = ["http://central.maven.org/maven2/"],
)
