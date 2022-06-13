//  Created by Nick Sudibor on 13.06.22.

import UIKit
import Login
import Routing

extension Router {
    public func routeToEnterPhone() {
        let factory = EnterPhoneFactory(router: self)
        let route = Route(
            destination: .build(with: factory),
            action: .push()
        )
        navigate(with: route)
    }
}
