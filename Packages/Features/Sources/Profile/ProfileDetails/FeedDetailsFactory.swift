//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class ProfileDetailsFactory: Factory {
    private let router: ProfileDetailsRouter

    public init(router: ProfileDetailsRouter) {
        self.router = router
    }

    public func build(with context: Void) -> UIViewController {
        let viewModel = ProfileDetailsViewModel(router: router)
        let controller = ProfileDetailsController(viewModel: viewModel)
        return controller
    }
}
