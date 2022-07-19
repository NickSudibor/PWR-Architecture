//  Created by Nick Sudibor on 19.07.22.

import UIKit
import PWRFoundation
import Routing
import RxSwift

public enum FeedIncomingRoute {
    case embed(in: UITabBarController)
}

final class FeedRouter: RouterTrait {
    @Injected private var factory: FeedFactoryProtocol
    private let disposeBag = DisposeBag()
    
    func process(_ incomingRoute: FeedIncomingRoute) {
        switch incomingRoute {
        case let .embed(tabBar):
            navigateToFeed(embedIn: tabBar)
        }
    }
}

// MARK: - Feed

private extension FeedRouter {
    func navigateToFeed(embedIn tabBar: UITabBarController) {
        let item = factory.buildFeed()
        item.routes
            .bind(onNext: process(feedRoute:))
            .disposed(by: disposeBag)
        
        tabBar.push(item.controller, animated: false)
    }
    
    func process(feedRoute: FeedRoute) {
        switch feedRoute {
        case .feedDetails:
            navigateToFeedDetails()
        }
    }
}

// MARK: - FeedDetails

private extension FeedRouter {
    func navigateToFeedDetails() {
        let item = factory.buildFeedDetails()
        item.routes
            .bind(onNext: process(feedDetailsRoute:))
            .disposed(by: disposeBag)
        
        push(item.controller)
    }
    
    func process(feedDetailsRoute: FeedDetailsRoute) {
        switch feedDetailsRoute {
        case .settings:
            break
        case .back:
            navigateBack()
        }
    }
}
