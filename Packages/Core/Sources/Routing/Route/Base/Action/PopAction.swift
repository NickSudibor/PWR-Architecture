//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class PopAction: RoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController?,
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        sourceController?.containerController?.pop(animated: animated)
    }
}
