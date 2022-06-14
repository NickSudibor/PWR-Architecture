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
    static func `default`() -> RouteBackActionBox {
        let action = DefaultRouteBackAction()
        return .init(action)
    }
}
