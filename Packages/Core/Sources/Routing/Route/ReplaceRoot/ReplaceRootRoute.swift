//  Created by Nick Sudibor on 13.06.22.

import Foundation

public struct ReplaceRootRoute {
    public let destination: RoutingDestinationBox
    public let action: ReplaceRootActionBox
    
    public init(
        destination: RoutingDestinationBox,
        action: ReplaceRootActionBox = .default()
    ) {
        self.destination = destination
        self.action = action
    }
}
