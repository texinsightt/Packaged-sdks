// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "NewkyCardScannerPackage",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NewkyCardScannerPackage",
            targets: ["NewkyCardScannerWrapper", "NewkyShared"]),
        .library(
            name: "NewkyFacePackage",
            targets: ["NewkyFaceWrapper", "NewkyShared"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            from: "10.10.0"
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
            from: "5.6.0"
        ),
        .package(
            url: "https://github.com/ninjaprox/NVActivityIndicatorView",
            from: "5.1.1"
        )
    ],
    targets: [
        .target(
            name: "NewkyShared",
            resources: [.copy("RawRes")]
        ),
        .target(
            name: "NewkyCardScannerWrapper",
            dependencies: [
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
                .product(name: "SwiftyTesseract", package: "SwiftyTesseract"),
                .target(name: "NewkyCardScanner")
            ],
            path: "Sources/NewkyCardScannerWrapper",
            resources: [
                .copy("RawRes")
            ],
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
            resources: [
                .copy("RawRes")
            ],
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "NewkyCardScanner",
            url: "https://github.com/texinsightt/Packaged-sdks/releases/download/0.0.5/NewkyCardScanner.xcframework.zip",
            checksum: "40f72cbd0eed7e7451ffec074f6de3fa1b52253c84a0ac28c4148ca94701c7d9"
        ),
        .binaryTarget(
            name: "NewkyFace",
            url: "https://github.com/texinsightt/Packaged-sdks/releases/download/0.0.5/NewkyFace.xcframework.zip",
            checksum: "4dab166aa8f07d9dd9b12db55092b024d575288c478ffa625fd7893b52a4aa98"
        )
    ]
)
