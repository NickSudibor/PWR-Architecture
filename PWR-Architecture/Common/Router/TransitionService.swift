//  Created by Nick Sudibor on 20.04.22.

import UIKit

enum TransitionType {
    case push
    case present
    case presentInNavigationController(UINavigationController)
    case setAsRoot(onWindow: UIWindow)
    case setAsRootInNavigationController(UINavigationController, onWindow: UIWindow)
}

protocol TransitionServiceProtocol: AnyObject {
    func performTransition(
        from hostController: UIViewController?,
        to destinationController: UIViewController,
        with transitionType: TransitionType
    )
}

final class TransitionService: TransitionServiceProtocol {
    func performTransition(
        from hostController: UIViewController?,
        to destinationController: UIViewController,
        with transitionType: TransitionType
    ) {
        switch transitionType {
        case .push:
            hostController?.navigationController?.pushViewController(destinationController, animated: true)
        case .present:
            hostController?.present(destinationController, animated: true)
        case let .presentInNavigationController(navigationController):
            navigationController.setViewControllers([destinationController], animated: false)
            hostController?.present(navigationController, animated: true)
        case let .setAsRoot(window):
            window.rootViewController = destinationController
        case let .setAsRootInNavigationController(navigationController, window):
            navigationController.setViewControllers([destinationController], animated: false)
            window.rootViewController = navigationController
        }
    }
}
