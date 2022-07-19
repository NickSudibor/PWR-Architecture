//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Routing

public final class FeedDependencies: DependencyContainer {
    public func register(using resolver: Resolver) {
        
        // Internal
        resolver.register(FeedFactoryProtocol.self, factory: { FeedFactory() }).scope(.application)
    }
}
