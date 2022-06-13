//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class EmbedRoutingDestination: RoutingDestination {
    private let container: ContainerController
    private let embedded: [RoutingDestination]
    
    public init(container: ContainerController, embedded: [RoutingDestination]) {
        self.container = container
        self.embedded = embedded
    }
    
    public func viewController() -> UIViewController {
        let embeddedControllers = embedded.map { $0.viewController() }
        container.setControllers(embeddedControllers, animated: false)
        return container
    }
}

public extension Array where Element == RoutingDestination {
    func embed(in container: ContainerController) -> RoutingDestination {
        return EmbedRoutingDestination(container: container, embedded: self)
    }
}
