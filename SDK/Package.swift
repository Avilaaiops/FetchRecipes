// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDK",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SDK",
            targets: ["SDK"]),
    ],
    targets: [
        // Targets are the basic bu3her targets in this package and products from dependencies.
        .target(
            name: "SDK"),
        .testTarget(
            name: "SDKTests",
            dependencies: ["SDK"]
        ),
    ]
)
