// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Persistence",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        .library(
            name: "Persistence",
            targets: ["Persistence"]
        )
    ],
    dependencies: [
        .package(
            path: "../Model"
        )
    ],
    targets: [
        .target(
            name: "Persistence",
            dependencies: ["Model"]
        )
    ]
)
