// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewkyPackage",
    defaultLocalization: LanguageTag("en"),
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NewkyCardScannerPackage",
            targets: ["NewkyTessData", "NewkyCardScannerSupport", "NewkyCardScanner"]
        ),
        .library(
            name: "NewkyFacePackage",
            targets: ["NewkyTessData", "NewkyFaceSupport", "NewkyFace"]
        )
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
            name: "NewkyTessData",
            dependencies: [
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
                .product(name: "SwiftyTesseract", package: "SwiftyTesseract")
            ],
            resources: [.copy("tdata")]
        ),
        .target(
            name: "NewkyCardScannerSupport",
            resources: [
                .copy("ScannerGoogleService-Info.plist")
            ]
        ),
        .target(
            name: "NewkyFaceSupport",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "NVActivityIndicatorView", package: "NVActivityIndicatorView"),
                .product(name: "SnapKit", package: "SnapKit"),
            ],
            resources: [
                .copy("FaceGoogleService-Info.plist")
            ]
        ),
        .binaryTarget(
            name: "NewkyCardScanner",
            url: "https://github.com/texinsightt/Packaged-sdks/releases/download/0.3.0/NewkyCardScanner.xcframework.zip",
            checksum: "cd2e742ee7b2a0c814dca192ede3c92dd09a388f8e74e6ddbe3576e61406092b"
        ),
        .binaryTarget(
            name: "NewkyFace",
            url: "https://github.com/texinsightt/Packaged-sdks/releases/download/0.3.0/NewkyFace.xcframework.zip",
            checksum: "44839d1728d0c515b5ad724ecd9727f9423360334246ec4f393b5cd8582bbf40"
        )
    ]
)
