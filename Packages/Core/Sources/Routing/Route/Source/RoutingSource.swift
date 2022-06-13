//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingSource {
    func viewController() -> UIViewController?
}

public extension RoutingSource {
    static func topmost() -> RoutingSource {
        return TopmostRoutingSource()
    }
    
    static func concrete(_ controller: UIViewController) -> RoutingSource {
        return ConcreteRoutingSource(controller)
    }
}
