//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Routing
import Settings
import Profile

extension Router: SettingsRouter {
    public func routeToProfileFromSettings() {
        let route = RouteBack(
            source: .findController(ofType: ProfileController.self),
            action: .makeVisible()
        )
        navigateBack(with: route)
    }
}
