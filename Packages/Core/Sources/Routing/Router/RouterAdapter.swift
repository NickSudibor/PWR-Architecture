//  Created by Nick Sudibor on 19.07.22.

import Foundation

public protocol RouterAdapter {
    associatedtype OutgoingRoute
    func process(_ outgoingRoute: OutgoingRoute)
}

// MARK: - AnyRouterAdapter

public extension RouterAdapter {
    func asAnyRouterAdapter() -> AnyRouterAdapter<OutgoingRoute> {
        return .init(self)
    }
}

public final class AnyRouterAdapter<OutgoingRoute>: RouterAdapter {
    private let _process: (OutgoingRoute) -> ()
    
    public init<Concrete: RouterAdapter>(_ concrete: Concrete) where Concrete.OutgoingRoute == OutgoingRoute {
        _process = concrete.process(_:)
    }
    
    public func process(_ outgoingRoute: OutgoingRoute) {
        _process(outgoingRoute)
    }
}
