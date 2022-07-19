//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation

public final class ProfileDependencies: DependencyContainer {
    public init() { }
    
    public func register(using resolver: Resolver) {
        
        // Internal
        resolver.register(ProfileFactoryProtocol.self, factory: { ProfileFactory() }).scope(.application)
    }
}
