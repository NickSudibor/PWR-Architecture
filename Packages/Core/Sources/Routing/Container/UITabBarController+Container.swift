//  Created by Nick Sudibor on 13.06.22.

import UIKit

extension UITabBarController: ContainerController {
    public var visibleController: UIViewController? {
        return selectedViewController
    }
    
    public var controllers: [UIViewController] {
        return viewControllers ?? []
    }
    
    
    public func setControllers(_ controllers: [UIViewController], animated: Bool) {
        setViewControllers(controllers, animated: animated)
    }
    
    public func push(_ controller: UIViewController, animated: Bool) {
        let currentControllers = viewControllers ?? []
        let newControllers = currentControllers + [controller]
        setViewControllers(newControllers, animated: animated)
    }
    
    public func pop(animated: Bool) {
        let currentControllers = viewControllers ?? []
        guard currentControllers.count > 1 else { return }
        let newControllers = Array(currentControllers.dropLast())
        setViewControllers(newControllers, animated: animated)
    }
    
    public func makeVisible(_ controller: UIViewController, animated: Bool) {
        guard controllers.contains(controller) else { return }
        guard selectedViewController != controller else { return }
        selectedViewController = controller
    }
}
