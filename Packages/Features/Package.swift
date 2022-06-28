// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Login", targets: ["Login"]),
        .library(name: "Feed", targets: ["Feed"]),
        .library(name: "Profile", targets: ["Profile"]),
        .library(name: "Settings", targets: ["Settings"]),
        .library(name: "Time", targets: ["Time"])
    ],
    dependencies: LocalDependency.sources + ExternalDependency.sources,
    targets: [
        .target(
            name: "Login",
            dependencies: Dependencies.link(
                localDependencies: [.PWRFoundation, .UIComponents, .Routing],
                externalDependencies: [.RxSwift, .RxRelay, .RxCocoa]
            )
        ),
        .target(
            name: "Feed",
            dependencies: Dependencies.link(
                localDependencies: [.PWRFoundation, .UIComponents, .Routing],
                externalDependencies: [.RxSwift, .RxRelay, .RxCocoa]
            )
        ),
        .target(
            name: "Profile",
            dependencies: Dependencies.link(
                localDependencies: [.PWRFoundation, .UIComponents, .Routing],
                externalDependencies: [.RxSwift, .RxRelay, .RxCocoa]
            )
        ),
        .target(
            name: "Settings",
            dependencies: Dependencies.link(
                localDependencies: [.PWRFoundation, .UIComponents, .Routing],
                externalDependencies: [.RxSwift, .RxRelay, .RxCocoa]
            )
        ),
        .target(
            name: "Time",
            dependencies: Dependencies.link(
                localDependencies: [.PWRFoundation, .UIComponents, .Routing],
                externalDependencies: [.RxSwift, .RxRelay, .RxCocoa]
            )
        )
    ]
)

// MARK: - Helpers

enum LocalDependency: CaseIterable {
    case PWRFoundation
    case UIComponents
    case Routing
    
    var value: Target.Dependency {
        switch self {
        case .PWRFoundation: return .product(name: "PWRFoundation", package: "Core")
        case .UIComponents: return .product(name: "UIComponents", package: "Core")
        case .Routing: return .product(name: "Routing", package: "Core")
        }
    }
    
    var source: Source {
        switch self {
        case .PWRFoundation, .UIComponents, .Routing:
            return .init(packageName: "Core", path: "../Core")
        }
    }
    
    static var sources: [Package.Dependency] {
        let sources = allCases.map { $0.source }
        let unique = Set(sources)
        return unique.map { .package(name: $0.packageName, path: $0.path) }
    }
    
    struct Source: Hashable {
        let packageName: String
        let path: String
    }
}

enum ExternalDependency: CaseIterable {
    case RxSwift
    case RxRelay
    case RxCocoa
    case SnapKit
    
    var value: Target.Dependency {
        switch self {
        case .RxSwift: return .product(name: "RxSwift", package: "RxSwift")
        case .RxRelay: return .product(name: "RxRelay", package: "RxSwift")
        case .RxCocoa: return .product(name: "RxCocoa", package: "RxSwift")
        case .SnapKit: return .product(name: "SnapKit", package: "SnapKit")
        }
    }
    
    var source: Source {
        switch self {
        case .RxSwift, .RxRelay, .RxCocoa:
            return .init(url: "https://github.com/ReactiveX/RxSwift", version: .from("6.5.0"))
        case .SnapKit:
            return .init(url: "https://github.com/SnapKit/SnapKit.git", version: .from("5.6.0"))
            
        }
    }
    
    static var sources: [Package.Dependency] {
        let sources = allCases.map { $0.source }
        let unique = Set(sources)
        let dependencies = unique.map { source -> Package.Dependency in
            switch source.version {
            case let .from(version):
                return .package(url: source.url, from: Version(stringLiteral: version))
            }
        }
        return dependencies
    }
    
    struct Source: Hashable {
        let url: String
        let version: Version
        
        enum Version: Hashable {
            case from(String)
        }
    }
}

enum Dependencies {
    static func link(
        targets: [String] = [],
        localDependencies: [LocalDependency] = [],
        externalDependencies: [ExternalDependency] = []
    ) -> [Target.Dependency] {
        let targets = targets.map { Target.Dependency.target(name: $0) }
        let locals = localDependencies.map { $0.value }
        let externals = externalDependencies.map { $0.value }
        return targets + locals + externals
    }
}
