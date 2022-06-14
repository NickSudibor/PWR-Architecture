//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Routing
import Feed

extension Router: FeedRouter {
    public func routeToFeedDetails() {
        let factory = FeedDetailsFactory(router: self)
        let route = Route(
            destination: .build(with: factory),
            action: .push()
        )
        navigate(with: route)
    }
}
