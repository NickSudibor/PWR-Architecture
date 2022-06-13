//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingDestination {
    func viewController() -> UIViewController
}

// MARK: - Box

public final class RoutingDestinationBox {
    public let boxedDestination: RoutingDestination
    
    public init(_ boxedDestination: RoutingDestination) {
        self.boxedDestination = boxedDestination
    }
}

public extension RoutingDestinationBox {
    static func build<FactoryType: Factory>(with factory: FactoryType) -> RoutingDestinationBox where FactoryType.Context == Void {
        let destination = BuildRoutingDestination(factory: factory.asAnyFactory())
        return .init(destination)
    }
    
    static func build<FactoryType: Factory>(with factory: FactoryType, and context: FactoryType.Context) -> RoutingDestinationBox {
        let destination = BuildRoutingDestination(factory: factory.asAnyFactory(), context: context)
        return .init(destination)
    }
    
    static func concrete(_ controller: UIViewController) -> RoutingDestinationBox {
        let destination = ConcreteRoutingDestination(controller)
        return .init(destination)
    }
    
    static func embed(_ destinations: [RoutingDestinationBox], in container: ContainerController) -> RoutingDestinationBox {
        let boxedDestinations = destinations.map { $0.boxedDestination }
        let embedDestination = EmbedRoutingDestination(container: container, embedded: boxedDestinations)
        return .init(embedDestination)
    }
}
