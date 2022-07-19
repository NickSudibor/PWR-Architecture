//  Created by Nick Sudibor on 20.06.22.

import UIKit

public final class MakeVisibleAction: RouteBackRoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        sourceController.dismiss(animated: true)
        makeVisible(sourceController, animated: animated)
        completion?(.success)
    }
    
    private func makeVisible(_ controller: UIViewController, animated: Bool) {
        guard let parentController = controller.parent else { return }
        if let container = parentController as? ContainerController {
            container.makeVisible(controller, animated: animated)
        }
        makeVisible(parentController, animated: animated)
    }
}
