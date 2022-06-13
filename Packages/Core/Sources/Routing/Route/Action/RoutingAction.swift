//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol RoutingAction {
    func perform(
        on sourceController: UIViewController?,
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    )
}

public extension RoutingAction {
    static func replaceRoot() -> RoutingAction {
        return ReplaceRootAction()
    }
    
    static func present() -> RoutingAction {
        return PresentAction()
    }
    
    static func push() -> RoutingAction {
        return PushAction()
    }
    
    static func pop() -> RoutingAction {
        return PopAction()
    }
}
