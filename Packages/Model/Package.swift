// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Model",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)        
    ],
    products: [
        .library(
            name: "Model",
            targets: ["Model"]
        )
    ],
    targets: [
        .target(
            name: "Model"
        ),
        .testTarget(
            name: "ModelTests",
            dependencies: ["Model"]
        )
    ]
)
