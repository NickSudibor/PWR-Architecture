//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingSource {
    func viewController() -> UIViewController?
}

// MARK: - Box

public final class RoutingSourceBox {
    public let value: RoutingSource
    
    public init(_ value: RoutingSource) {
        self.value = value
    }
}

public extension RoutingSourceBox {
    static func topmost() -> RoutingSourceBox {
        let source = TopmostRoutingSource()
        return .init(source)
    }
    
    static func concrete(_ controller: UIViewController) -> RoutingSourceBox {
        let source = ConcreteRoutingSource(controller)
        return .init(source)
    }
}
