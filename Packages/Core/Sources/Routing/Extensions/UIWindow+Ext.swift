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
}
