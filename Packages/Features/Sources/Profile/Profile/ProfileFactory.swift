//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class ProfileFactory: Factory {
    private let router: ProfileRouter
    
    public init(router: ProfileRouter) {
        self.router = router
    }
    
    public func build(with context: Void) -> UIViewController {
        let viewModel = ProfileViewModel(router: router)
        let controller = ProfileController(viewModel: viewModel)
        return controller
    }
}
