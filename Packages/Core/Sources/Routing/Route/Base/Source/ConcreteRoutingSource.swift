//  Created by Nick Sudibor on 13.06.22.

import UIKit

public final class ConcreteRoutingSource: RoutingSource {
    private let controller: UIViewController
    
    public init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    public func viewController() throws -> UIViewController {
        return controller
    }
}
