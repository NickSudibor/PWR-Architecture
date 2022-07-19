//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Routing
import Login
import Feed
import Profile
import Settings

final class Dependencies {
    private let resolver = Resolver.main
    
    func register() {
        let containers: [DependencyContainer] = [
            LoginDependencies(),
            FeedDependencies(),
            ProfileDependencies(),
            SettingsDependencies()
        ]
        containers.forEach { $0.register(using: resolver) }
        
        // Routing Adapters
        resolver.register(AnyRouter<LoginOutwardRoute>.self, factory: { LoginRoutingAdapter().asAnyRouter() }).scope(.application)
        resolver.register(AnyRouter<FeedOutwardRoute>.self, factory: { FeedRoutingAdapter().asAnyRouter() }).scope(.application)
        resolver.register(AnyRouter<ProfileOutwardRoute>.self, factory: { ProfileRoutingAdapter().asAnyRouter() }).scope(.application)
    }
}
