//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Routing

public final class ProfileDependencies: DependencyContainer {
    public init() { }
    
    public func register(using resolver: Resolver) {
        // Public
        resolver.register(AnyRouter<ProfileIncomingRoute>.self, factory: { ProfileRouter().asAnyRouter() }).scope(.application)
        
        // Internal
        resolver.register(ProfileFactoryProtocol.self, factory: { ProfileFactory() }).scope(.application)
    }
}
