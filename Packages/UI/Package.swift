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
            path: "../Model"
        ),
        .package(
            path: "../Mock"
        )
    ],
    targets: [
        .target(
            name: "UI",
            dependencies: ["Model", "Mock"]
        )
    ]
)
