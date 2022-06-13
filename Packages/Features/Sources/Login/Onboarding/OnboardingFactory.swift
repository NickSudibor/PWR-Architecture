//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class OnboardingFactory: Factory {
    private let router: OnboardingRouter
    
    public init(router: OnboardingRouter) {
        self.router = router
    }
    
    public func build(with context: Void) -> UIViewController {
        let viewModel = OnboardingViewModel(router: router)
        let controller = OnboardingController(viewModel: viewModel)
        return controller
    }
}
