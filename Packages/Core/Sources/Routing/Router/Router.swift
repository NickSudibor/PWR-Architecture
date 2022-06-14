//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class Router {
    public init() { }
    
    public func navigate(with route: ReplaceRootRoute, animated: Bool = false, completion: (() -> Void)? = nil) {
        let destinationController = route.destination.value.viewController()
        let action = route.action.value
        action.perform(with: destinationController, animated: animated, completion: completion)
    }
    
    public func navigate(with route: Route, animated: Bool = true, completion: (() -> Void)? = nil) {
        let sourceController = route.source.value.viewController()
        let destinationController = route.destination.value.viewController()
        let action = route.action.value
        action.perform(on: sourceController, with: destinationController, animated: animated, completion: completion)
    }
    
    public func navigateBack(with route: RouteBack, animated: Bool = true, completion: (() -> Void)? = nil) {
        let sourceController = route.source.value.viewController()
        let action = route.action.value
        action.perform(on: sourceController, animated: animated, completion: completion)
    }
}
