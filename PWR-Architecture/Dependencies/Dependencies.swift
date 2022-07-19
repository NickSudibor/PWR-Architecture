//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Routing
import Login
import Feed
import Profile

final class Dependencies {
    private let resolver = Resolver.main
    
    func register() {
        let containers: [DependencyContainer] = [
            LoginDependencies(),
            FeedDependencies(),
            ProfileDependencies()
        ]
        containers.forEach { $0.register(using: resolver) }
        
        // Routing Adapters
        resolver.register(AnyRouter<LoginOutgoingRoute>.self, factory: { LoginRouterAdapter().asAnyRouter() }).scope(.application)
    }
}
