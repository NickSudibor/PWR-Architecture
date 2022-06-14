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
    public let value: ReplaceRootRoutingAction
    
    init(_ value: ReplaceRootRoutingAction) {
        self.value = value
    }
}

public extension ReplaceRootActionBox {
    static func `default`() -> ReplaceRootActionBox {
        let action = DefaultReplaceRootAction()
        return .init(action)
    }
}
