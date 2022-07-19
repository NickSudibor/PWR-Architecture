//  Created by Nick Sudibor on 20.07.22.

import UIKit
import Routing
import PWRFoundation
import RxSwift

public enum ProfileIncomingRoute {
    case embed(in: UITabBarController)
}

final class ProfileRouter: RouterTrait {
    @Injected private var factory: ProfileFactory
    private let disposeBag = DisposeBag()
    
    func process(_ incomingRoute: ProfileIncomingRoute) {
        switch incomingRoute {
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
        
        tabBar.push(item.controller, animated: false)
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
            break
        case .back:
            navigateBack()
        }
    }
}
