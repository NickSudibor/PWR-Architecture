//  Created by Nick Sudibor on 10.06.22.

import UIKit
import Routing

public final class ConfirmPhoneFactory: Factory {
    public init() { }
    
    public func build(with context: Void) -> UIViewController {
        let viewModel = ConfirmPhoneViewModel()
        let controller = ConfirmPhoneController(viewModel: viewModel)
        return controller
    }
}
