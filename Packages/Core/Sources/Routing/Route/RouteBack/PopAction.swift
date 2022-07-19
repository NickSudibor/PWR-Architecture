//  Created by Nick Sudibor on 14.06.22.

import UIKit

public final class PopAction: RouteBackRoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        guard let container = sourceController.containerController else {
            completion?(.failure(RoutingError.containerControllerIsMissing))
            return
        }
        container.pop(animated: animated)
        completion?(.success)
    }
}
