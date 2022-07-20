//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import Feed
import Settings

final class FeedRoutingAdapter: RouterTrait {
    @LazyInjected private var settingsRouter: AnyRouter<SettingsStartingPoint>
    
    func process(_ point: FeedFinishPoint) {
        switch point {
        case .settings:
            settingsRouter.process(.settings)
        }
    }
}
