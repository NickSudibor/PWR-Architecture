//  Created by Nick Sudibor on 10.06.22.

import UIKit

public final class LoginFactory {
    public init() { }
    
    public func build() -> UIViewController {
        let viewModel = LoginViewModel()
        let controller = LoginController(viewModel: viewModel)
        return controller
    }
}
