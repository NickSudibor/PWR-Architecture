//  Created by Nick Sudibor on 28.06.22.

import UIKit
import Routing

public final class TimeFactory: Factory {
    public init() { }
    
    public func build(with context: Void) -> UIViewController {
        let presenter = TimePresenter()
        let viewModel = TimeViewModel(presenter: presenter)
        let controller = TimeController(viewModel: viewModel)
        return controller
    }
}
