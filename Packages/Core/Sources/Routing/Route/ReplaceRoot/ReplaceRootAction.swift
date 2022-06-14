//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol ReplaceRootRoutingAction {
    func perform(
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    )
}

// MARK: - Builder

public final class ReplaceRootActionBuilder {
    public let value: ReplaceRootRoutingAction
    
    init(_ value: ReplaceRootRoutingAction) {
        self.value = value
    }
}

public extension ReplaceRootActionBuilder {
    static func `default`() -> ReplaceRootActionBuilder {
        let action = DefaultReplaceRootAction()
        return .init(action)
    }
}
