// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxAdaptivePresentation",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RxAdaptivePresentation",
            targets: ["RxAdaptivePresentation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RxAdaptivePresentation",
            dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
        .testTarget(
            name: "RxAdaptivePresentationTests",
            dependencies: ["RxAdaptivePresentation"]),
    ],
    swiftLanguageVersions: [.v5]
)

