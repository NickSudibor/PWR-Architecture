//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import Profile
import Settings

final class ProfileRoutingAdapter: RouterTrait {
    @Injected private var settingsRouter: AnyRouter<SettingsStartingPoint>

    func process(_ point: ProfileFinishPoint) {
        switch point {
        case .settings:
            settingsRouter.process(.settings)
        }
    }
}
