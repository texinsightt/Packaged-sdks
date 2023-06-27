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
    dependencies: [ ],
    targets: [
        .target(
            name: "NewkyTessData",
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
            resources: [
                .copy("FaceGoogleService-Info.plist")
            ]
        ),
        .binaryTarget(
            name: "NewkyCardScanner",
            url: "https://github.com/texinsightt/Packaged-sdks/releases/download/0.2.0/NewkyCardScanner.xcframework.zip",
            checksum: "120b67ea63b0907dd108d5a4bcce6b785838e1a70521981dd7ee113aaf34ca40"
        ),
        .binaryTarget(
            name: "NewkyFace",
            url: "https://github.com/texinsightt/Packaged-sdks/releases/download/0.2.0/NewkyFace.xcframework.zip",
            checksum: "ee156baee7529cbf3df51f3466fa719be5fa247f8f11b67b9aa923dc722039d8"
        )
    ]
)
