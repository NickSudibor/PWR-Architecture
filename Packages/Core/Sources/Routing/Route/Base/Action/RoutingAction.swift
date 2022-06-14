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

// MARK: - Builder

public final class RoutingActionBuilder {
    public let value: RoutingAction
    
    public init(_ value: RoutingAction) {
        self.value = value
    }
}

public extension RoutingActionBuilder {
    static func present() -> RoutingActionBuilder {
        let action = PresentAction()
        return .init(action)
    }
    
    static func push() -> RoutingActionBuilder {
        let action = PushAction()
        return .init(action)
    }
    
    static func pop() -> RoutingActionBuilder {
        let action = PopAction()
        return .init(action)
    }
}
