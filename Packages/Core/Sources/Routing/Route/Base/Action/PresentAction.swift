//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class PresentAction: RoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController,
        with destinationController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        sourceController.present(destinationController, animated: animated, completion: { completion?(.success) })
    }
}
