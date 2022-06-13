//  Created by Nick Sudibor on 10.06.22.

import UIKit

public final class ConfirmPhoneFactory {
    public init() { }
    
    public func build() -> UIViewController {
        let viewModel = ConfirmPhoneViewModel()
        let controller = ConfirmPhoneController(viewModel: viewModel)
        return controller
    }
}
