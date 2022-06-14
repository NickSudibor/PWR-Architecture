//  Created by Nick Sudibor on 13.06.22.

import UIKit
import Routing
import Login
import Feed
import Profile

extension Router: EnterPhoneRouter {
    public func routeToHome() {
        let feedFactory = FeedFactory(router: self)
        let feed: RoutingDestinationBox = .embed(.build(with: feedFactory), in: UINavigationController())
        
        let profileFactory = ProfileFactory(router: self)
        let profile: RoutingDestinationBox = .embed(.build(with: profileFactory), in: UINavigationController())
        
        let tabBar: RoutingDestinationBox = .embed([feed, profile], in: UITabBarController())
        let route = ReplaceRootRoute(
            destination: tabBar,
            action: .default()
        )
        navigate(with: route, animated: false)
    }
}
