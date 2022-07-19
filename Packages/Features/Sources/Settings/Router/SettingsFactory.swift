//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing

protocol SettingsFactoryProtocol {
    func buildSettings() -> RoutableItem<SettingsRoute>
}

final class SettingsFactory: SettingsFactoryProtocol {
    func buildSettings() -> RoutableItem<SettingsRoute> {
        let viewModel = SettingsViewModel()
        let controller = SettingsController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
}
