//  Created by Nick Sudibor on 11.06.22.

import UIKit

public final class ConcreteRoutingDestination: RoutingDestination {
    private let controller: UIViewController
    
    public init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    public func viewController() -> UIViewController {
        return controller
    }
}
