//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class PushAction: RoutingAction {
    public init() { }
    
    public func perform(
        on sourceController: UIViewController,
        with destinationController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        guard let container = sourceController.containerController else {
            completion?(.failure(RoutingError.containerControllerIsMissing))
            return
        }
        container.push(destinationController, animated: animated)        
        completion?(.success)
    }
}
