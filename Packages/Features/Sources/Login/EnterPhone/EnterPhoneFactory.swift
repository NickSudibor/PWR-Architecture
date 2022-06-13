//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class EnterPhoneFactory: Factory {
    private let router: EnterPhoneRouter
    
    public init(router: EnterPhoneRouter) {
        self.router = router
    }
    
    public func build(with context: Void) -> UIViewController {
        let viewModel = EnterPhoneViewModel(router: router)
        let controller = EnterPhoneController(viewModel: viewModel)
        return controller
    }
}
