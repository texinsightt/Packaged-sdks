// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewkyCardScannerPackage",
    products: [
        .library(
            name: "NewkyCardScannerPackage",
            targets: ["NewkyCardScannerWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            from: "10.9.0"
        ),
        .package(
            url: "https://github.com/SwiftyTesseract/SwiftyTesseract.git",
            from: "4.0.1"
        )
    ],
    targets: [
        .target(
            name: "NewkyCardScannerWrapper",
            dependencies: [
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
                .product(name: "SwiftyTesseract", package: "SwiftyTesseract"),
                .target(name: "NewkyCardScanner")
            ],
            path: "Sources/NewkyCardScannerWrapper",
            publicHeadersPath: ""
        ),
        .binaryTarget(name: "NewkyCardScanner", path: "./Sources/NewkyCardScanner.xcframework")
    ]
)
