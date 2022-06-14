//  Created by Nick Sudibor on 13.06.22.

import Foundation

public struct ReplaceRootRoute {
    public let destination: RoutingDestinationBuilder
    public let action: ReplaceRootActionBuilder
    
    public init(
        destination: RoutingDestinationBuilder,
        action: ReplaceRootActionBuilder
    ) {
        self.destination = destination
        self.action = action
    }
}
