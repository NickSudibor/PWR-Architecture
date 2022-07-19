//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Routing

public final class LoginDependencies: DependencyContainer {
    public init() { }
    
    public func register(using resolver: Resolver) {
        // Public
        resolver.register(AnyRouter<LoginInwardRoute>.self, factory: { LoginRouter().asAnyRouter() }).scope(.application)
        
        // Internal
        resolver.register(LoginFactoryProtocol.self, factory: { LoginFactory() }).scope(.application)
    }
}
