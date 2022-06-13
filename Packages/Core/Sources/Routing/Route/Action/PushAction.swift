//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class PushAction: RoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController?,
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        sourceController?.containerController?.push(destinationController, animated: animated)
    }
}
