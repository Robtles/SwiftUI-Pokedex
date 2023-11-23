// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Provider",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "Provider",
            targets: ["Provider"]
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
            name: "Provider",
            dependencies: ["Moya"]
        ),
        .testTarget(
            name: "ProviderTests",
            dependencies: ["Provider"]
        )
    ]
)
