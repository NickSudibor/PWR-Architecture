//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Routing
import Profile

extension Router: ProfileRouter {
    public func routeToProfileDetails() {
        let factory = ProfileDetailsFactory(router: self)
        let route = Route(
            destination: .build(with: factory),
            action: .push()
        )
        navigate(with: route)
    }
}
