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

// MARK: - Box

public final class RoutingActionBox {
    public let boxedAction: RoutingAction
    
    public init(_ boxedAction: RoutingAction) {
        self.boxedAction = boxedAction
    }
}

public extension RoutingActionBox {
    static func present() -> RoutingActionBox {
        let action = PresentAction()
        return .init(action)
    }
    
    static func push() -> RoutingActionBox {
        let action = PushAction()
        return .init(action)
    }
    
    static func pop() -> RoutingActionBox {
        let action = PopAction()
        return .init(action)
    }
}
