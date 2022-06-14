//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class FeedFactory: Factory {
    private let router: FeedRouter
    
    public init(router: FeedRouter) {
        self.router = router
    }
    
    public func build(with context: Void) -> UIViewController {
        let viewModel = FeedViewModel(router: router)
        let controller = FeedController(viewModel: viewModel)
        return controller
    }
}
