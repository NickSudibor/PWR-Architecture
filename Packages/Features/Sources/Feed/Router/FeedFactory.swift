//  Created by Nick Sudibor on 19.07.22.

import UIKit
import Routing

protocol FeedFactoryProtocol {
    func buildFeed() -> RoutableItem<FeedRoute>
    func buildFeedDetails() -> RoutableItem<FeedDetailsRoute>
}

final class FeedFactory: FeedFactoryProtocol {
    func buildFeed() -> RoutableItem<FeedRoute> {
        let viewModel = FeedViewModel()
        let controller = FeedController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
    
    func buildFeedDetails() -> RoutableItem<FeedDetailsRoute> {
        let viewModel = FeedDetailsViewModel()
        let controller = FeedDetailsController(viewModel: viewModel)
        return .init(controller: controller, routes: viewModel.routesObservable)
    }
}
