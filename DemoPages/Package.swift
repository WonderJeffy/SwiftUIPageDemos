// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DemoPages",
    defaultLocalization: "en", // 启用本地化支持
    platforms: [
        .iOS(.v17)
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
        .package(url: "https://github.com/exyte/ConcentricOnboarding", from: "1.0.0"),
        .package(url: "https://github.com/izyumkin/MCEmojiPicker", from: "1.2.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DemoPages",
            dependencies: [
                .product(name: "I18NResource", package: "I18NResource"),
                .onboarding,
                .emojiPicker
            ]
        ),
        .testTarget(
            name: "DemoPagesTests",
            dependencies: ["DemoPages", .onboarding, .emojiPicker]
        ),
    ]
)


extension Target.Dependency {
    static let onboarding = Self.product(name: "ConcentricOnboarding", package: "ConcentricOnboarding")
    static let emojiPicker = Self.product(name: "MCEmojiPicker", package: "MCEmojiPicker")
}
