//  Created by Nick Sudibor on 20.06.22.

import UIKit

public final class MakeVisibleAction: RouteBackRoutingAction {
    private let windowProvider: WindowProvider
    
    public init(windowProvider: WindowProvider = KeyWindowProvider()) {
        self.windowProvider = windowProvider
    }
    
    public func perform(
        on sourceController: UIViewController?,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        guard let sourceController = sourceController else { return }
        sourceController.dismiss(animated: true)
        windowProvider.window.makeVisible(sourceController, animated: animated)
    }
}
