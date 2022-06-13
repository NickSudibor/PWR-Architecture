//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class Router {
    func route(with route: Route, animated: Bool = true, completion: (() -> Void)? = nil) {
        let sourceController = route.source.viewController()
        let destinationController = route.destination.viewController()
        route.action.perform(on: sourceController, with: destinationController, animated: animated, completion: completion)
    }
}
