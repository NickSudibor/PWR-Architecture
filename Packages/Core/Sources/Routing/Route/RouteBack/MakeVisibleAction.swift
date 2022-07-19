//  Created by Nick Sudibor on 20.06.22.

import UIKit

public final class MakeVisibleAction: RouteBackRoutingAction {
    private let finder: FinderProtocol
    
    public init(finder: FinderProtocol = Finder()) {
        self.finder = finder
    }
    
    public func perform(
        on sourceController: UIViewController?,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        guard let sourceController = sourceController else { return }
        sourceController.dismiss(animated: true)
        finder.makeVisible(sourceController, animated: animated)
    }
}
