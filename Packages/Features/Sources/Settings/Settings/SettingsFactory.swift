//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class SettingsFactory: Factory {
    private let router: SettingsRouter
    
    public init(router: SettingsRouter) {
        self.router = router
    }
    
    public func build(with context: Void) -> UIViewController {
        let viewModel = SettingsViewModel(router: router)
        let controller = SettingsController(viewModel: viewModel)
        return controller
    }
}
