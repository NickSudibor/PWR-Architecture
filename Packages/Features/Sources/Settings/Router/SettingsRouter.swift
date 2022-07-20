//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import RxSwift

public enum SettingsStartingPoint {
    case settings
}

final class SettingsRouter: RouterTrait {
    @Injected private var factory: SettingsFactoryProtocol
    private let disposeBag = DisposeBag()
    
    func process(_ point: SettingsStartingPoint) {
        switch point {
        case .settings:
            navigateToSettigns()
        }
    }
}

// MARK: - Settings

private extension SettingsRouter {
    func navigateToSettigns() {
        let item = factory.buildSettings()
        item.routes
            .bind(onNext: process(settingsRoute:))
            .disposed(by: disposeBag)
        
        present(item.controller)
    }
    
    func process(settingsRoute: SettingsRoute) {
        switch settingsRoute {
        case .close:
            dismiss()
        }
    }
}
