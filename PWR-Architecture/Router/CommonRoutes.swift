//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Routing

extension Router {
    public func routeBack() {
        let route = RouteBack(
            source: .topmost(),
            action: .default()
        )
        navigateBack(with: route, animated: true)
    }
}
