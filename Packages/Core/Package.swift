// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "UIComponents", targets: ["UIComponents"])
    ],
    dependencies: [
        // MARK: - 3rd Party
        .package(url: "https://github.com/SnapKit/SnapKit.git", exact: "5.6.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0")
    ],
    targets: [
        .target(
            name: "UIComponents",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit")
            ]
        )
    ]
)
