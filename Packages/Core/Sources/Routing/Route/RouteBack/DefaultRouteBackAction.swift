//  Created by Nick Sudibor on 14.06.22.

import UIKit

public final class DefaultRouteBackAction: RouteBackRoutingAction {
    public func perform(
        on sourceController: UIViewController?,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        sourceController?.containerController?.pop(animated: animated)
    }
}
