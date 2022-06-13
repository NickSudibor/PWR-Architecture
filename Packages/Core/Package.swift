// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PWRFoundation", targets: ["PWRFoundation"]),
        .library(name: "UIComponents", targets: ["UIComponents"]),
        .library(name: "Routing", targets: ["Routing"])
    ],
    dependencies: ExternalDependency.sources,
    targets: [
        .target(
            name: "PWRFoundation",
            dependencies: Dependencies.link(
                externalDependencies: [.RxSwift, .RxRelay]
            )
        ),
        .target(
            name: "UIComponents",
            dependencies: Dependencies.link(
                externalDependencies: [.SnapKit]
            )
        ),
        .target(name: "Routing")
    ]
)

// MARK: - Helpers

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
        externalDependencies: [ExternalDependency] = []
    ) -> [Target.Dependency] {
        let targets = targets.map { Target.Dependency.target(name: $0) }
        let externals = externalDependencies.map { $0.value }
        return targets + externals
    }
}
