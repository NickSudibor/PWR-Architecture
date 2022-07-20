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
        resolver.register(AnyRouter<LoginFinishPoint>.self, factory: { LoginRoutingAdapter().asAnyRouter() }).scope(.application)
        resolver.register(AnyRouter<FeedFinishPoint>.self, factory: { FeedRoutingAdapter().asAnyRouter() }).scope(.application)
        resolver.register(AnyRouter<ProfileFinishPoint>.self, factory: { ProfileRoutingAdapter().asAnyRouter() }).scope(.application)
    }
}
