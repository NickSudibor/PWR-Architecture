//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol Router { }

public extension Router {
    func navigate(with route: Route, animated: Bool = true, completion: ((RoutingResult) -> Void)? = nil) {
        do {
            let sourceController = try route.source.value.viewController()
            let destinationController = route.destination.value.viewController()
            let action = route.action.value
            action.perform(on: sourceController, with: destinationController, animated: animated, completion: completion)
        } catch {
            completion?(.failure(error))
        }
    }
    
    func navigate(with route: ReplaceRootRoute, animated: Bool = true, completion: ((RoutingResult) -> Void)? = nil) {
        let destinationController = route.destination.value.viewController()
        let action = route.action.value
        action.perform(with: destinationController, animated: animated, completion: completion)
    }
    
    func navigateBack(with route: RouteBack, animated: Bool = true, completion: ((RoutingResult) -> Void)? = nil) {
        do {
            let sourceController = try route.source.value.viewController()
            let action = route.action.value
            action.perform(on: sourceController, animated: animated, completion: completion)
        } catch {
            completion?(.failure(error))
        }
    }
}
