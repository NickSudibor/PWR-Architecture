//  Created by Nick Sudibor on 19.07.22.

import UIKit
import Routing
import RxSwift

public enum LoginIncomingRoute {
    case enterPhone
}

final class LoginRouter: RouterTrait {
    typealias IncomingRoute = LoginIncomingRoute
    
    private let factory: LoginFactoryProtocol
    private let disposeBag = DisposeBag()
    
    init(factory: LoginFactoryProtocol = LoginFactory()) {
        self.factory = factory
    }
    
    func process(_ incomingRoute: LoginIncomingRoute) {
        switch incomingRoute {
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
            destination: .embed(item.controller, in: UINavigationController()),
            action: .default()
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
        
        let route = Route(
            destination: .to(item.controller),
            action: .push()
        )
        navigate(with: route)
    }
    
    func process(confirmPhoneRoute: ConfirmPhoneRoute) {
        switch confirmPhoneRoute {
        case .confirm:
            break
        }
    }
}