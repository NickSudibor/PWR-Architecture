//  Created by Nick Sudibor on 13.06.22.

import UIKit
import Login
import Routing

extension Router {
    func routeToOnboarding() {
        let factory = OnboardingFactory(router: self)
        let route = ReplaceRootRoute(
            destination: .embed(
                [.build(with: factory)],
                in: UINavigationController()
            ),
            action: .default()
        )
        navigate(with: route, animated: false)
    }
}
