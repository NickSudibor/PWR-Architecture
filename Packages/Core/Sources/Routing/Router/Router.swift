//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol Router {
    associatedtype StartingPoint
    func process(_ point: StartingPoint)
}

// MARK: - AnyRouter

public extension Router {
    func asAnyRouter() -> AnyRouter<StartingPoint> {
        return .init(self)
    }
}

public final class AnyRouter<StartingPoint>: Router {
    private let _process: (StartingPoint) -> ()
    
    public init<Concrete: Router>(_ concrete: Concrete) where Concrete.StartingPoint == StartingPoint {
        _process = concrete.process(_:)
    }
    
    public func process(_ point: StartingPoint) {
        _process(point)
    }
}
