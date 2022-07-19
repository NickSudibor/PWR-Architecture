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
    static func to(_ controller: UIViewController) -> RoutingDestinationBox {
        let destination = ConcreteRoutingDestination(controller)
        return .init(destination)
    }
    
    static func embed(_ controller: UIViewController, in container: ContainerController) -> RoutingDestinationBox {
        let embedDestination = EmbedRoutingDestination(
            container: container,
            embedded: [ConcreteRoutingDestination(controller)]
        )
        return .init(embedDestination)
    }
    
    static func embed(_ controllers: [UIViewController], in container: ContainerController) -> RoutingDestinationBox {
        let embedDestination = EmbedRoutingDestination(
            container: container,
            embedded: controllers.map { ConcreteRoutingDestination($0) }
        )
        return .init(embedDestination)
    }
}
