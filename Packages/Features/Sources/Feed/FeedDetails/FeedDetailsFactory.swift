//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class FeedDetailsFactory: Factory {
    private let router: FeedDetailsRouter

    public init(router: FeedDetailsRouter) {
        self.router = router
    }

    public func build(with context: Void) -> UIViewController {
        let viewModel = FeedDetailsViewModel(router: router)
        let controller = FeedDetailsController(viewModel: viewModel)
        return controller
    }
}
