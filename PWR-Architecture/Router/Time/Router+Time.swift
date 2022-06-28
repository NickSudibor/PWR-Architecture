//  Created by Nick Sudibor on 28.06.22.

import UIKit
import Routing
import Time

extension Router {
    func routeToTime() {
        let factory = TimeFactory()
        let route = ReplaceRootRoute(
            destination: .build(with: factory),
            action: .default()
        )
        navigate(with: route)
    }
}
