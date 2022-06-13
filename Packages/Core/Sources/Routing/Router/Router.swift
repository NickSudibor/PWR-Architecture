//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class Router {
    public init() { }
    
    public func navigate(with route: Route, animated: Bool = true, completion: (() -> Void)? = nil) {
        let sourceController = route.source.boxedSource.viewController()
        let destinationController = route.destination.boxedDestination.viewController()
        let action = route.action.boxedAction
        action.perform(on: sourceController, with: destinationController, animated: animated, completion: completion)
    }
    
    public func navigate(with route: ReplaceRootRoute, animated: Bool = false, completion: (() -> Void)? = nil) {
        let destinationController = route.destination.boxedDestination.viewController()
        let action = route.action.boxedAction
        action.perform(with: destinationController, animated: animated, completion: completion)
    }
}
