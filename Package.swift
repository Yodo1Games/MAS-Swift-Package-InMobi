// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationInMobi",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationInMobi", targets: ["Yodo1MasMediationInMobiTarget"]),
        .library(name: "Yodo1MasMediationInMobi-AppLovinMediationInMobiAdapter", targets: ["Yodo1MasMediationInMobi-AppLovinMediationInMobiAdapterTarget"]),
        .library(name: "Yodo1MasMediationInMobi-InMobiAdapter", targets: ["Yodo1MasMediationInMobi-InMobiAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/InMobi/InMobiSDK-Swift-Package.git", exact: "11.5.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationInMobi ====================
        .target(
            name: "Yodo1MasMediationInMobiTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationInMobi"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "InMobiSDK", package: "InMobiSDK-Swift-Package"),
            ],
            path: "Sources/Yodo1MasMediationInMobiTarget",
            resources: [.copy("Yodo1MasInMobi.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationInMobi",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationInMobi/Yodo1MasMediationInMobi-5.0.0-beta.5.zip",
            checksum: "861e884adaed9ca616abdad5007fa95f5683501b8a68d68181fd016f6ad6140f"
        ),
        // ==================== Yodo1MasMediationInMobi-AppLovinMediationInMobiAdapter ====================
        .target(
            name: "Yodo1MasMediationInMobi-AppLovinMediationInMobiAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationInMobiTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationInMobiAdapter"),
            ],
            path: "Sources/Yodo1MasMediationInMobi-AppLovinMediationInMobiAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationInMobiAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationInMobi/AppLovinMediationInMobiAdapter-5.0.0-beta.5.zip",
            checksum: "e321f665e54e7d5c3bad6ad9f5fbbbe4c23a37d5e4181160cd0e13b07aee1934"
        ),
        // ==================== Yodo1MasMediationInMobi-InMobiAdapter ====================
        .target(
            name: "Yodo1MasMediationInMobi-InMobiAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationInMobiTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "InMobiAdapter"),
            ],
            path: "Sources/Yodo1MasMediationInMobi-InMobiAdapterTarget"
        ),
        .binaryTarget(
            name: "InMobiAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationInMobi/InMobiAdapter-5.0.0-beta.5.zip",
            checksum: "49decbdb1f6dbbc5fd78e137487f63a1708004cbc8604db6d7f73dde8dfb10f3"
        ),
    ]
)
