// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "API",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "API",
            targets: ["API"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Moya/Moya.git",
            from: "15.0.0"
        )
    ],
    targets: [
        .target(
            name: "API",
            dependencies: ["Moya"]
        ),
        .testTarget(
            name: "APITests",
            dependencies: ["API", "Moya"]
        )
    ]
)
