//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class ReplaceRootAction: RoutingAction {
    private let windowProvider: WindowProvider
    
    public init(windowProvider: WindowProvider = KeyWindowProvider()) {
        self.windowProvider = windowProvider
    }
    
    public func perform(
        on sourceController: UIViewController?,
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        windowProvider.window.rootViewController = destinationController
    }
}
