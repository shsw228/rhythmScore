// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "BuildTools",
    dependencies: [
        .package(url: "https://github.com/mono0926/LicensePlist", from: 
"3.23.4")
    ],
    targets: [.target(name: "BuildTools", path: "")]
)
