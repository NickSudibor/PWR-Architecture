//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Routing

extension Router {
    public func routeBack() {
        let route = RouteBack(
            source: .topmost(),
            action: .pop()
        )
        navigateBack(with: route, animated: true)
    }
    
    public func dismiss() {
        let route = RouteBack(
            source: .topmost(),
            action: .dismiss()
        )
        navigateBack(with: route, animated: true)
    }
}
