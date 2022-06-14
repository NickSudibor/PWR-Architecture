//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingDestination {
    func viewController() -> UIViewController
}

// MARK: - Builder

public final class RoutingDestinationBuilder {
    public let value: RoutingDestination
    
    public init(_ value: RoutingDestination) {
        self.value = value
    }
}

public extension RoutingDestinationBuilder {
    static func build<FactoryType: Factory>(with factory: FactoryType) -> RoutingDestinationBuilder where FactoryType.Context == Void {
        let destination = BuildRoutingDestination(factory: factory.asAnyFactory())
        return .init(destination)
    }
    
    static func build<FactoryType: Factory>(with factory: FactoryType, and context: FactoryType.Context) -> RoutingDestinationBuilder {
        let destination = BuildRoutingDestination(factory: factory.asAnyFactory(), context: context)
        return .init(destination)
    }
    
    static func concrete(_ controller: UIViewController) -> RoutingDestinationBuilder {
        let destination = ConcreteRoutingDestination(controller)
        return .init(destination)
    }
    
    static func embed(_ destinations: [RoutingDestinationBuilder], in container: ContainerController) -> RoutingDestinationBuilder {
        let boxedDestinations = destinations.map { $0.value }
        let embedDestination = EmbedRoutingDestination(container: container, embedded: boxedDestinations)
        return .init(embedDestination)
    }
}
