//  Created by Nick Sudibor on 10.06.22.

import Foundation

public struct Route {
    public let source: RoutingSourceBox
    public let destination: RoutingDestinationBox
    public let action: RoutingActionBox
    
    public init(
        source: RoutingSourceBox = .topmost(),
        destination: RoutingDestinationBox,
        action: RoutingActionBox
    ) {
        self.source = source
        self.destination = destination
        self.action = action
    }
}
