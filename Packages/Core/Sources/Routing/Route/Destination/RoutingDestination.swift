//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingDestination {
    func viewController() -> UIViewController
}

public extension RoutingDestination {
    static func build(with factory: AnyFactory<Void>) -> RoutingDestination {
        return BuildRoutingDestination(factory: factory)
    }
    
    static func build<FactoryType: Factory>(with factory: FactoryType, and context: FactoryType.Context) -> RoutingDestination {
        return BuildRoutingDestination(factory: factory.asAnyFactory(), context: context)
    }
    
    static func concrete(_ controller: UIViewController) -> RoutingDestination {
        return ConcreteRoutingDestination(controller)
    }
}
