//  Created by Nick Sudibor on 13.06.22.

import UIKit

public extension UIWindow {
    var topmostController: UIViewController? {
        guard let rootController = rootViewController else { return nil }
        var topController = rootController
        while true {
            if let presentedController = topController.presentedViewController, !presentedController.isBeingDismissed {
                topController = presentedController
            } else if let containerController = topController as? ContainerController,
                      let visibleController = containerController.visibleController {
                topController = visibleController
            } else {
                return topController
            }
        }
    }
    
    func findController(using predicate: (UIViewController) -> Bool) -> UIViewController? {
        guard let rootController = rootViewController else { return nil }
        return findController(startingFrom: rootController, using: predicate)
    }
    
    private func findController(
        startingFrom originController: UIViewController,
        using predicate: (UIViewController) -> Bool
    ) -> UIViewController? {
        if predicate(originController) {
            return originController
        }
        if let container = originController as? ContainerController {
            let results = container.controllers.compactMap { findController(startingFrom: $0, using: predicate) }
            if let result = results.first {
                return result
            }
        }
        if let presentedController = originController.presentedViewController {
            if let result = findController(startingFrom: presentedController, using: predicate) {
                return result
            }
        }
        return nil
    }
    
    func makeVisible(_ controller: UIViewController, animated: Bool) {
        guard let parentController = controller.parent else { return }
        if let container = parentController as? ContainerController {
            container.makeVisible(controller, animated: animated)
        }
        makeVisible(parentController, animated: animated)
    }
}
