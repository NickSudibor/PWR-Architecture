//  Created by Nick Sudibor on 11.06.22.

import UIKit

public final class BuildRoutingDestination<Context>: RoutingDestination {
    private let factory: AnyFactory<Context>
    private let context: Context
    
    public init(factory: AnyFactory<Context>, context: Context) {
        self.factory = factory
        self.context = context
    }
    
    public init(factory: AnyFactory<Void>) where Context == Void {
        self.factory = factory
        self.context = Void()
    }
    
    public func viewController() -> UIViewController {
        factory.build(with: context)
    }
}
