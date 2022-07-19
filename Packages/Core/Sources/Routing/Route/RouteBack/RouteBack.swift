//  Created by Nick Sudibor on 14.06.22.

import Foundation

public struct RouteBack {
    public let source: RoutingSourceBox
    public let action: RouteBackActionBox
    
    public init(
        source: RoutingSourceBox = .topmost(),
        action: RouteBackActionBox
    ) {
        self.source = source
        self.action = action
    }
}
