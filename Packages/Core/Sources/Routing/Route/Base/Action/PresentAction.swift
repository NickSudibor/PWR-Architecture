//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class PresentAction: RoutingAction {
    private let presentationStyle: UIModalPresentationStyle
    private let transitionStyle: UIModalTransitionStyle
    
    public init(
        presentationStyle: UIModalPresentationStyle = .automatic,
        transitionStyle: UIModalTransitionStyle = .coverVertical
    ) {
        self.presentationStyle = presentationStyle
        self.transitionStyle = transitionStyle
    }
    
    public func perform(
        on sourceController: UIViewController,
        with destinationController: UIViewController,
        animated: Bool,
        completion: ((RoutingResult) -> Void)?
    ) {
        destinationController.modalPresentationStyle = presentationStyle
        destinationController.modalTransitionStyle = transitionStyle
        sourceController.present(destinationController, animated: animated, completion: { completion?(.success) })
    }
}
