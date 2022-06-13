//  Created by Nick Sudibor on 10.06.22.

import UIKit

public final class EnterPhoneFactory {
    public init() { }
    
    public func build() -> UIViewController {
        let viewModel = EnterPhoneViewModel()
        let controller = EnterPhoneController(viewModel: viewModel)
        return controller
    }
}
