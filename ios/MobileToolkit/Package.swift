// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "MobileToolkit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MobileToolkit",
            targets: ["MobileToolkit"]),
    ],
    dependencies: [
        // Dependencies will be added as needed
    ],
    targets: [
        .target(
            name: "MobileToolkit",
            dependencies: []),
        .testTarget(
            name: "MobileToolkitTests",
            dependencies: ["MobileToolkit"]),
    ]
)