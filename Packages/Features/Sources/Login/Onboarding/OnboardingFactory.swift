//  Created by Nick Sudibor on 10.06.22.

import UIKit

public final class OnboardingFactory {
    public init() { }
    
    public func build() -> UIViewController {
        let viewModel = OnboardingViewModel()
        let controller = OnboardingController(viewModel: viewModel)
        return controller
    }
}
