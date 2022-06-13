//  Created by Nick Sudibor on 13.06.22.

import UIKit

extension UINavigationController: ContainerController {
    public var visibleController: UIViewController? {
        return visibleViewController
    }
    
    public func push(_ controller: UIViewController, animated: Bool) {
        pushViewController(controller, animated: animated)
    }
    
    public func pop(animated: Bool) {
        popViewController(animated: animated)
    }
}
