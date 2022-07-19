//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol RoutingAction {
    func perform(
        on sourceController: UIViewController,
        with destinationController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    )
}

// MARK: - Box

public final class RoutingActionBox {
    public let value: RoutingAction
    
    public init(_ value: RoutingAction) {
        self.value = value
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
}
