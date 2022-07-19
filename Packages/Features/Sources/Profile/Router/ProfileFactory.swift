//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing

protocol ProfileFactoryProtocol {
    func buildProfile() -> RoutableItem<ProfileRoute>
    func buildProfileDetails() -> RoutableItem<ProfileDetailsRoute>
}

final class ProfileFactory: ProfileFactoryProtocol {
    func buildProfile() -> RoutableItem<ProfileRoute> {
        let viewModel = ProfileViewModel()
        let controller = ProfileController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
    
    func buildProfileDetails() -> RoutableItem<ProfileDetailsRoute> {
        let viewModel = ProfileDetailsViewModel()
        let controller = ProfileDetailsController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
    
    
}
