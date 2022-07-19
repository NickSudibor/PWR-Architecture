//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import Profile
import Settings

final class ProfileRoutingAdapter: RouterTrait {
    @Injected private var settingsRouter: AnyRouter<SettingsInwardRoute>

    func process(_ inwardRoute: ProfileOutwardRoute) {
        switch inwardRoute {
        case .settings:
            settingsRouter.process(.settings)
        }
    }
}
