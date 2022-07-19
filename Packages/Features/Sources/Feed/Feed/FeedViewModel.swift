//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import Routing

protocol FeedViewModelProtocol {
    var actions: AnyObserver<Feed.Action> { get }
}

enum FeedRoute {
    case feedDetails
}

final class FeedViewModel: FeedViewModelProtocol, Routable {
    typealias Route = FeedRoute
    
    private let actionRelay = PublishRelay<Feed.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Feed.Action> { actionRelay.asObserver() }
    
    init() {
        subscribeToActions()
    }
}

// MARK: - Actions

private extension FeedViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: Feed.Action) {
        switch action {
        case .feedDetailsTapped:
            routes.accept(.feedDetails)
        }
    }
}
