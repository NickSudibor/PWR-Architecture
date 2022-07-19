//  Created by Nick Sudibor on 14.06.22.

import UIKit

public final class DismissAction: RouteBackRoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        sourceController.dismiss(animated: animated, completion: { completion?(.success) })
    }
}
