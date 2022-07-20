//  Created by Nick Sudibor on 20.07.22.

import UIKit
import PWRFoundation
import Routing
import Login
import Feed
import Profile

final class LoginRoutingAdapter: RouterTrait {
    @Injected private var feedRouter: AnyRouter<FeedStartingPoint>
    @Injected private var profileRouter: AnyRouter<ProfileStartingPoint>
    
    func process(_ point: LoginFinishPoint) {
        switch point {
        case .loginSucceeded:
            navigateToTabBar()
        }
    }
    
    private func navigateToTabBar() {
        let tabBar = UITabBarController()
        feedRouter.process(.embed(in: tabBar))
        profileRouter.process(.embed(in: tabBar))
        
        let route = ReplaceRootRoute(destination: .to(tabBar))
        navigate(with: route)
    }
}
