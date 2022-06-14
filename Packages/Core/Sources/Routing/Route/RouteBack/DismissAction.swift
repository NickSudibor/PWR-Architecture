//  Created by Nick Sudibor on 14.06.22.

import UIKit

public final class DismissAction: RouteBackRoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController?,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        sourceController?.dismiss(animated: animated, completion: completion)
    }
}
