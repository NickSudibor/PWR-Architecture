//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingDestination {
    func viewController() -> UIViewController
}

// MARK: - Box

public final class RoutingDestinationBox {
    public let value: RoutingDestination
    
    public init(_ value: RoutingDestination) {
        self.value = value
    }
}

public extension RoutingDestinationBox {
    static func concrete(_ controller: UIViewController) -> RoutingDestinationBox {
        let destination = ConcreteRoutingDestination(controller)
        return .init(destination)
    }
    
    static func embed(_ destination: RoutingDestinationBox, in container: ContainerController) -> RoutingDestinationBox {
        let embedDestination = EmbedRoutingDestination(container: container, embedded: [destination.value])
        return .init(embedDestination)
    }
    
    static func embed(_ destinations: [RoutingDestinationBox], in container: ContainerController) -> RoutingDestinationBox {
        let destinationValues = destinations.map { $0.value }
        let embedDestination = EmbedRoutingDestination(container: container, embedded: destinationValues)
        return .init(embedDestination)
    }
}
