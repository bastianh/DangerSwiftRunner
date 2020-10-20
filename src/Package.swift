// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftDanger",
    products: [
       .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]), // dev
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "DangerDependencies", dependencies: ["Danger"])
    ]
)
