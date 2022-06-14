//  Created by Nick Sudibor on 10.06.22.

import Foundation

public struct Route {
    public let source: RoutingSourceBuilder
    public let destination: RoutingDestinationBuilder
    public let action: RoutingActionBuilder
    
    public init(
        source: RoutingSourceBuilder = .topmost(),
        destination: RoutingDestinationBuilder,
        action: RoutingActionBuilder
    ) {
        self.source = source
        self.destination = destination
        self.action = action
    }
}
