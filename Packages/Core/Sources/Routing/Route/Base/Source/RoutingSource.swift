//  Created by Nick Sudibor on 11.06.22.

import UIKit

public protocol RoutingSource {
    func viewController() -> UIViewController?
}

// MARK: - Builder

public final class RoutingSourceBuilder {
    public let value: RoutingSource
    
    public init(_ value: RoutingSource) {
        self.value = value
    }
}

public extension RoutingSourceBuilder {
    static func topmost() -> RoutingSourceBuilder {
        let source = TopmostRoutingSource()
        return .init(source)
    }
    
    static func concrete(_ controller: UIViewController) -> RoutingSourceBuilder {
        let source = ConcreteRoutingSource(controller)
        return .init(source)
    }
}
