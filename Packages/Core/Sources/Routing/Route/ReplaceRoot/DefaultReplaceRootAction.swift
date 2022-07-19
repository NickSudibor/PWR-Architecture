//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class DefaultReplaceRootAction: ReplaceRootRoutingAction {
    private let windowProvider: WindowProvider
    
    public init(windowProvider: WindowProvider = KeyWindowProvider()) {
        self.windowProvider = windowProvider
    }
    
    public func perform(
        with destinationController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        let window = windowProvider.window
        if animated {
            UIView.transition(with: window, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                let animationsState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = destinationController
                UIView.setAnimationsEnabled(animationsState)
            })
        } else {
            window.rootViewController = destinationController
        }
        completion?(.success)
    }
}
