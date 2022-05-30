// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Login", targets: ["Login"]),
        .library(name: "Feed", targets: ["Feed"]),
        .library(name: "Profile", targets: ["Profile"]),
        .library(name: "Settings", targets: ["Settings"])
    ],
    dependencies: [
        .package(path: "../Core"),
        
        // MARK: - 3rd Party
        .package(url: "https://github.com/SnapKit/SnapKit.git", exact: "5.6.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0")
    ],
    targets: [
        .target(
            name: "Login",
            dependencies: [
                .product(name: "UIComponents", package: "Core"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "RxSwift", package: "RxSwift")
            ]
        ),
        .target(
            name: "Feed",
            dependencies: [
                .product(name: "UIComponents", package: "Core"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "RxSwift", package: "RxSwift")
            ]
        ),
        .target(
            name: "Profile",
            dependencies: [
                .product(name: "UIComponents", package: "Core"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "RxSwift", package: "RxSwift")
            ]
        ),
        .target(
            name: "Settings",
            dependencies: [
                .product(name: "UIComponents", package: "Core"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "RxSwift", package: "RxSwift")
            ]
        ),
    ]
)
