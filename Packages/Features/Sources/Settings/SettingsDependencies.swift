//  Created by Nick Sudibor on 20.07.22.

import Foundation
import PWRFoundation
import Routing

public final class SettingsDependencies: DependencyContainer {
    public init() { }
    
    public func register(using resolver: Resolver) {
        // Public
        resolver.register(AnyRouter<SettingsInwardRoute>.self, factory: { SettingsRouter().asAnyRouter() })
        
        // Internal
        resolver.register(SettingsFactoryProtocol.self, factory: { SettingsFactory() }).scope(.application)
    }
}
