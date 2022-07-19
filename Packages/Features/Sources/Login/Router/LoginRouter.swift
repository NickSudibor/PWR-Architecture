//  Created by Nick Sudibor on 19.07.22.

import UIKit
import PWRFoundation
import Routing
import RxSwift

public enum LoginInwardRoute {
    case enterPhone
}

public enum LoginOutwardRoute {
    case loginSucceeded
}

final class LoginRouter: RouterTrait {    
    @Injected private var factory: LoginFactoryProtocol
    @Injected private var adapted: AnyRouter<LoginOutwardRoute>
    private let disposeBag = DisposeBag()
    
    func process(_ inwardRoute: LoginInwardRoute) {
        switch inwardRoute {
        case .enterPhone:
            navigateToEnterPhone()
        }
    }
}

// MARK: - Enter Phone

private extension LoginRouter {
    func navigateToEnterPhone() {
        let item = factory.buildEnterPhone()
        item.routes
            .bind(onNext: process(enterPhoneRoute:))
            .disposed(by: disposeBag)
        
        let route = ReplaceRootRoute(
            destination: .embed(item.controller, in: UINavigationController())
        )
        navigate(with: route)
    }
    
    func process(enterPhoneRoute: EnterPhoneRoute) {
        switch enterPhoneRoute {
        case .continue:
            navigateToConfirmPhone()
        }
    }
}

// MARK: - Confirm Phone

private extension LoginRouter {
    func navigateToConfirmPhone() {
        let item = factory.buildConfirmPhone()
        item.routes
            .bind(onNext: process(confirmPhoneRoute:))
            .disposed(by: disposeBag)
        
        push(item.controller)
    }
    
    func process(confirmPhoneRoute: ConfirmPhoneRoute) {
        switch confirmPhoneRoute {
        case .confirm:
            adapted.process(.loginSucceeded)
        case .back:
            navigateBack()
        }
    }
}
