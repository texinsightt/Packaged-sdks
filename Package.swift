// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "NewkyCardScannerPackage",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NewkyCardScannerPackage",
            targets: ["NewkyCardScannerWrapper"]),
        .library(
            name: "NewkyFacePackage",
            targets: ["NewkyFaceWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            from: "10.9.0"
        ),
        .package(
            url: "https://github.com/SwiftyTesseract/SwiftyTesseract.git",
            from: "4.0.1"
        ),
        .package(
            url: "https://github.com/grpc/grpc-swift",
            from: "1.16.0"
        ),
        .package(
            url: "https://github.com/SnapKit/SnapKit",
            from: "5.0.0"
        ),
        .package(
            url: "https://github.com/ninjaprox/NVActivityIndicatorView",
            from: "5.1.1"
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
        .target(
            name: "NewkyFaceWrapper",
            dependencies: [
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
                .product(name: "SwiftyTesseract", package: "SwiftyTesseract"),
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "NVActivityIndicatorView", package: "NVActivityIndicatorView"),
                .product(name: "SnapKit", package: "SnapKit"),
                .target(name: "NewkyFace")
            ],
            path: "Sources/NewkyFaceWrapper",
            publicHeadersPath: ""
        ),
        .binaryTarget(name: "NewkyCardScanner", path: "./Sources/NewkyCardScanner.xcframework"),
        .binaryTarget(name: "NewkyFace", path: "./Sources/NewkyFace.xcframework")
    ]
)
