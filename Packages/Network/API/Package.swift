// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "API",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "API",
            targets: ["API"]
        )
    ],
    dependencies: [
        .package(
            path: "../Mapper"
        ),
        .package(
            path: "../Mock"
        ),
        .package(
            path: "../Model"
        ),
        .package(
            path: "../Provider"
        ),
        .package(
            url: "https://github.com/Moya/Moya.git",
            from: "15.0.0"
        )
    ],
    targets: [
        .target(
            name: "API",
            dependencies: ["Mapper", "Moya", "Model", "Provider"]
        ),
        .testTarget(
            name: "APITests",
            dependencies: ["API", "Mapper", "Mock", "Moya", "Model", "Provider"]
        )
    ]
)
