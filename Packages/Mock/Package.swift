// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mock",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "Mock",
            targets: ["Mock"]
        )
    ],
    dependencies: [
        .package(
            path: "../Model"
        )
    ],
    targets: [
        .target(
            name: "Mock",
            dependencies: ["Model"]
        ),
        .testTarget(
            name: "MockTests",
            dependencies: ["Mock"]
        )
    ]
)
