//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import RxSwift

public enum ProfileStartingPoint {
    case embed(in: UITabBarController)
}

public enum ProfileFinishPoint {
    case settings
}

final class ProfileRouter: RouterTrait {
    @LazyInjected private var factory: ProfileFactoryProtocol
    @LazyInjected private var adapter: AnyRouter<ProfileFinishPoint>
    private let disposeBag = DisposeBag()
    
    func process(_ point: ProfileStartingPoint) {
        switch point {
        case let .embed(tabBar):
            navigateToProfile(embedIn: tabBar)
        }
    }
}

// MARK: - Profile

private extension ProfileRouter {
    func navigateToProfile(embedIn tabBar: UITabBarController) {
        let item = factory.buildProfile()
        item.routes
            .bind(onNext: process(profileRoute:))
            .disposed(by: disposeBag)
        
        let navigationController = UINavigationController(rootViewController: item.controller)
        tabBar.push(navigationController, animated: false)
    }
    
    func process(profileRoute: ProfileRoute) {
        switch profileRoute {
        case .profileDetails:
            navigateToProfileDetails()
        }
    }
}

// MARK: - ProfileDetails

private extension ProfileRouter {
    func navigateToProfileDetails() {
        let item = factory.buildProfileDetails()
        item.routes
            .bind(onNext: process(profileDetailsRoute:))
            .disposed(by: disposeBag)
        
        push(item.controller)
    }
    
    func process(profileDetailsRoute: ProfileDetailsRoute) {
        switch profileDetailsRoute {
        case .settings:
            adapter.process(.settings)
        case .back:
            navigateBack()
        }
    }
}
