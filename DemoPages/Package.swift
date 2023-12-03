// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DemoPages",
    defaultLocalization: "en", // 启用本地化支持
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DemoPages",
            targets: ["DemoPages"]
        ),
    ],
    dependencies: [
        .package(path: "I18NResource"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DemoPages",
            dependencies: [
                .product(name: "I18NResource", package: "I18NResource"),
            ]
        ),
        .testTarget(
            name: "DemoPagesTests",
            dependencies: ["DemoPages"]
        ),
    ]
)
