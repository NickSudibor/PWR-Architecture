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
        completion: (() -> Void)?
    ) {
        windowProvider.window.rootViewController = destinationController
    }
}
