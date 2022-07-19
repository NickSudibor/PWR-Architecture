//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import Feed
import Settings

final class FeedRoutingAdapter: RouterTrait {
    @Injected private var settingsRouter: AnyRouter<SettingsInwardRoute>
    
    func process(_ inwardRoute: FeedOutwardRoute) {
        switch inwardRoute {
        case .settings:
            settingsRouter.process(.settings)
        }
    }
}
