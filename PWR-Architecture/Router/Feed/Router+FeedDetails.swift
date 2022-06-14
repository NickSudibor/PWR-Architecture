//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Routing
import Feed
import Settings

extension Router: FeedDetailsRouter {
    public func routeToSettings() {
        let factory = SettingsFactory(router: self)
        let route = Route(
            destination: .embed(.build(with: factory), in: UINavigationController()),
            action: .present()
        )
        navigate(with: route)
    }
}
