//  Created by Nick Sudibor on 19.07.22.

import UIKit

public protocol RouterTrait: Router { }

public extension RouterTrait {
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
    
    func navigate(with route: RouteBack, animated: Bool = true, completion: ((RoutingResult) -> Void)? = nil) {
        do {
            let sourceController = try route.source.value.viewController()
            let action = route.action.value
            action.perform(on: sourceController, animated: animated, completion: completion)
        } catch {
            completion?(.failure(error))
        }
    }
}

// MARK: - Common Routes

public extension RouterTrait {
    func push(
        _ controller: UIViewController,
        animated: Bool = true,
        completion: ((RoutingResult) -> Void)? = nil
    ) {
        let route = Route(
            destination: .to(controller),
            action: .push()
        )
        navigate(with: route, animated: animated, completion: completion)
    }
    
    func navigateBack() {
        let route = RouteBack(action: .pop())
        navigate(with: route)
    }
    
    func present(
        _ controller: UIViewController,
        animated: Bool = true,
        completion: ((RoutingResult) -> Void)? = nil
    ) {
        let route = Route(
            destination: .to(controller),
            action: .present()
        )
        navigate(with: route, animated: animated, completion: completion)
    }
    
    func dismiss(
        animated: Bool = true,
        completion: ((RoutingResult) -> Void)? = nil
    ) {
        let route = RouteBack(action: .dismiss())
        navigate(with: route, animated: animated, completion: completion)
    }
}
