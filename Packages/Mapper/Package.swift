// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mapper",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "Mapper",
            targets: ["Mapper"]
        )
    ],
    dependencies: [
        .package(
            path: "../Mock"
        ),
        .package(
            path: "../Model"
        )
    ],
    targets: [
        .target(
            name: "Mapper",
            dependencies: ["Model"]
        ),
        .testTarget(
            name: "MapperTests",
            dependencies: ["Mapper", "Mock"],
            resources: [
                .copy("Resources/evolution-chain_10.json"),
                .copy("Resources/evolution-chain_29.json"),
                .copy("Resources/evolution-chain_40.json"),
                .copy("Resources/evolution-chain_41.json"),
                .copy("Resources/evolution-chain_67.json"),
                .copy("Resources/evolution-chain_144.json"),
                                
                .copy("Resources/pokemon_25.json"),
                .copy("Resources/pokemon_69.json"),
                .copy("Resources/pokemon_92.json"),
                .copy("Resources/pokemon_95.json"),
                .copy("Resources/pokemon_133.json"),
                .copy("Resources/pokemon_290.json"),
                
                .copy("Resources/pokemon-species_25.json"),
                .copy("Resources/pokemon-species_69.json"),
                .copy("Resources/pokemon-species_92.json"),
                .copy("Resources/pokemon-species_95.json"),
                .copy("Resources/pokemon-species_133.json"),                
                .copy("Resources/pokemon-species_290.json"),
                
                .copy("Resources/version_1.json")
            ]
        )
    ]
)
