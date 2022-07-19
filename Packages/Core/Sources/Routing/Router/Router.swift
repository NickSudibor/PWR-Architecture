//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol Router {
    associatedtype InwardRoute
    func process(_ inwardRoute: InwardRoute)
}

// MARK: - AnyRouter

public extension Router {
    func asAnyRouter() -> AnyRouter<InwardRoute> {
        return .init(self)
    }
}

public final class AnyRouter<InwardRoute>: Router {
    private let _process: (InwardRoute) -> ()
    
    public init<Concrete: Router>(_ concrete: Concrete) where Concrete.InwardRoute == InwardRoute {
        _process = concrete.process(_:)
    }
    
    public func process(_ inwardRoute: InwardRoute) {
        _process(inwardRoute)
    }
}
