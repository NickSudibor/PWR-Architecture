//  Created by Nick Sudibor on 14.06.22.

import UIKit
import Login
import Routing

public extension Router {
    func routeToConfirmPhone() {
        let factory = ConfirmPhoneFactory()
        let route = Route(
            destination: .build(with: factory),
            action: .push()
        )
        navigate(with: route)
    }
}
