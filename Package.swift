// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "RSBarcodes_Swift",
    platforms: [.iOS(.v9), .macOS(.v10_15)],
    products: [
        .library(name: "RSBarcodes_Swift", targets: ["RSBarcodes_Swift"]),
    ],
    targets: [
        .target(
            name: "RSBarcodes_Swift",
            path: "Source"
        ),
    ]
)
