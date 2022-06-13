//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol RoutingAction {
    func perform(
        on sourceController: UIViewController?,
        with destinationController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    )
}
