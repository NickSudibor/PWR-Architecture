//  Created by Nick Sudibor on 14.06.22.

import UIKit

public protocol RouteBackRoutingAction {
    func perform(
        on sourceController: UIViewController?,
        animated: Bool,
        completion: (() -> Void)?
    )
}

// MARK: - Box

public final class RouteBackActionBox {
    public let value: RouteBackRoutingAction
    
    public init(_ value: RouteBackRoutingAction) {
        self.value = value
    }
}

public extension RouteBackActionBox {
    static func pop() -> RouteBackActionBox {
        let action = PopAction()
        return .init(action)
    }
    
    static func dismiss() -> RouteBackActionBox {
        let action = DismissAction()
        return .init(action)
    }
    
    static func makeVisible() -> RouteBackActionBox {
        let action = MakeVisibleAction()
        return .init(action)
    }
}
