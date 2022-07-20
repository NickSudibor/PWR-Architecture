//  Created by Nick Sudibor on 19.07.22.

import UIKit
import PWRFoundation
import Routing
import RxSwift

public enum FeedStartingPoint {
    case embed(in: UITabBarController)
}

public enum FeedFinishPoint {
    case settings
}

final class FeedRouter: RouterTrait {
    @Injected private var factory: FeedFactoryProtocol
    @Injected private var adapter: AnyRouter<FeedFinishPoint>
    private let disposeBag = DisposeBag()
    
    func process(_ point: FeedStartingPoint) {
        switch point {
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
        
        let navigationController = UINavigationController(rootViewController: item.controller)
        tabBar.push(navigationController, animated: false)
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
            adapter.process(.settings)
        case .back:
            navigateBack()
        }
    }
}
