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
    commit = "8bdb568547ddd5935ea2df39e311432c614d8508",
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

maven_jar(
    name = "kind_projector_2_12",
    artifact = "org.spire-math:kind-projector_2.12:0.9.6",
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
