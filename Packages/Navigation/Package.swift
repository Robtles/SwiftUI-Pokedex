// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Navigation",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "Navigation",
            targets: ["Navigation"]
        ),
    ],
    dependencies: [
        .package(
            path: "../Defaults"
        )
    ],
    targets: [
        .target(
            name: "Navigation",
            dependencies: ["Defaults"]
        )
    ]
)
