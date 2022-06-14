//  Created by Nick Sudibor on 13.06.22.

import UIKit
import Routing
import Login

extension Router {
    public func routeToOnboarding() {
        let factory = OnboardingFactory(router: self)
        let route = ReplaceRootRoute(
            destination: .embed(.build(with: factory), in: UINavigationController()),
            action: .default()
        )
        navigate(with: route, animated: false)
    }
}

extension Router: OnboardingRouter {
    public func routeToEnterPhone() {
        let factory = EnterPhoneFactory(router: self)
        let route = Route(
            destination: .build(with: factory),
            action: .push()
        )
        navigate(with: route)
    }
}
