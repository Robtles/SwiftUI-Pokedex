// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WatchAPI",
    defaultLocalization: "en",
    platforms: [
        .watchOS(.v10)
    ],
    products: [
        .library(
            name: "WatchAPI",
            targets: ["WatchAPI"]
        )
    ],
    dependencies: [
        .package(
            path: "../API"
        ),
        .package(
            path: "../Mapper"
        ),
        .package(
            path: "../Model"
        )
    ],
    targets: [
        .target(
            name: "WatchAPI",
            dependencies: ["API", "Mapper", "Model"],
            resources: [
                .copy("Resources/pokemons.json")
            ]
        )
    ]
)
