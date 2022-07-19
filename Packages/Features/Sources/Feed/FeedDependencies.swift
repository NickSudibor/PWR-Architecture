//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Routing

public final class FeedDependencies: DependencyContainer {
    public init() { }
    
    public func register(using resolver: Resolver) {
        // Public
        resolver.register(AnyRouter<FeedInwardRoute>.self, factory: { FeedRouter().asAnyRouter() }).scope(.application)
        
        // Internal
        resolver.register(FeedFactoryProtocol.self, factory: { FeedFactory() }).scope(.application)
    }
}
