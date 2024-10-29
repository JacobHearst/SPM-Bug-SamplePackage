// swift-tools-version: 6.0

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SamplePackage",
    products: [
        .library(name: "SamplePackage", targets: ["SamplePackage"]),
        .library(name: "SecondProduct", targets: ["SamplePackage"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "600.0.0"),
    ],
    targets: [
        .target(
            name: "SamplePackage",
            dependencies: [
                "SampleMacro"
            ]
        ),
        .plugin(
            name: "CheckProducts",
            capability: .command(
                intent: .custom(
                    verb: "dump-products",
                    description: "Prints the products given to the plugin"
                ),
                permissions: []
            )
        ),
        .macro(
            name: "SampleMacro",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax")
            ]
        )
    ]
)
