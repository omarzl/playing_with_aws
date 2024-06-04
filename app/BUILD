load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load(
  "@build_bazel_rules_apple//apple:ios.bzl",
  "ios_application",
  "ios_unit_test",
  "ios_framework",
)
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

swift_library(
    name = "DynamicLib",
    srcs = glob(["DynamicFramework/*.swift"]),
    module_name = "DynamicLib",
)

ios_framework(
    name = "DynamicFramework",
    families = ["iphone"],
    bundle_id = "com.omarzl.DynamicFramework",
    minimum_os_version = "15.0",
    infoplists = ["DynamicFramework/Info.plist"],
    deps = [":DynamicLib"],
)

swift_library(
    name = "Sources",
    srcs = glob(["Demo/*.swift"]),
    module_name = "Demo",
    deps = [":DynamicLib"],
)

swift_library(
    name = "Tests",
    testonly = True,
    srcs = glob(["DemoTests/*.swift"]),
    deps = [
        ":Sources",
    ],
)

ios_unit_test(
    name = "UnitTests",
    minimum_os_version = "15.0",
    deps = [":Tests"],
    visibility = ["//visibility:public"],
)

ios_application(
    name = "App",
    bundle_id = "com.omarzl.Demo",
    families = ["iphone"],
    infoplists = [":Demo/Info.plist"],
    minimum_os_version = "15.0",
    visibility = ["//visibility:public"],
    deps = [":Sources"],
    frameworks = [":DynamicFramework"],
)

xcodeproj(
    name = "xcodeproj",
    project_name = "App",
    tags = ["manual"],
    top_level_targets = [
        top_level_target(":App", target_environments = ["simulator"]),
        ":UnitTests",
    ],
)
