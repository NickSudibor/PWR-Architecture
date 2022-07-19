//  Created by Nick Sudibor on 19.07.22.

import UIKit
import Routing

protocol LoginFactoryProtocol {
    func buildEnterPhone() -> RoutableItem<EnterPhoneRoute>
    func buildConfirmPhone() -> RoutableItem<ConfirmPhoneRoute>
}

final class LoginFactory: LoginFactoryProtocol {
    func buildEnterPhone() -> RoutableItem<EnterPhoneRoute> {
        let viewModel = EnterPhoneViewModel()
        let controller = EnterPhoneController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
    
    func buildConfirmPhone() -> RoutableItem<ConfirmPhoneRoute> {
        let viewModel = ConfirmPhoneViewModel()
        let controller = ConfirmPhoneController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
}
