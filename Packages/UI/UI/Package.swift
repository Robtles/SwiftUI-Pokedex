// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UI",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "UI",
            targets: ["UI"]
        )
    ],
    dependencies: [
        .package(
            path: "../API"
        ),
        .package(
            path: "../Defaults"
        ),
        .package(
            path: "../Error"
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            from: "7.0.0"
        ),
        .package(
            path: "../Model"
        ),
        .package(
            path: "../Mock"
        ),
        .package(
            path: "../Navigation"
        ),
        .package(
            path: "../SharedUI"
        )
    ],
    targets: [
        .target(
            name: "UI",
            dependencies: ["API", "Defaults", "Error", "Kingfisher", "Model", "Mock", "Navigation", "SharedUI"],
            resources: [
                .process("Resources/animated_pokeball.gif"),
                .process("Resources/Assets.xcassets")
            ]
        )
    ]
)
