//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol ReplaceRootRoutingAction {
    func perform(
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    )
}

// MARK: - Box

public final class ReplaceRootActionBox {
    public let boxedAction: ReplaceRootRoutingAction
    
    init(_ boxedAction: ReplaceRootRoutingAction) {
        self.boxedAction = boxedAction
    }
}

public extension ReplaceRootActionBox {
    static func `default`() -> ReplaceRootActionBox {
        let action = DefaultReplaceRootAction()
        return .init(action)
    }
}
