//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol Router {
    associatedtype IncomingRoute
    func process(_ incomingRoute: IncomingRoute)
}

// MARK: - AnyRouter

public final class AnyRouter<IncomingRoute>: Router {
    private let _process: (IncomingRoute) -> ()
    
    public init<Concrete: Router>(_ concrete: Concrete) where Concrete.IncomingRoute == IncomingRoute {
        _process = concrete.process(_:)
    }
    
    public func process(_ incomingRoute: IncomingRoute) {
        _process(incomingRoute)
    }
}
