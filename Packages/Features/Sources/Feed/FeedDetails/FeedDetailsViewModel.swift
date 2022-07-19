//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import Routing

protocol FeedDetailsViewModelProtocol {
    var actions: AnyObserver<FeedDetails.Action> { get }
}

enum FeedDetailsRoute {
    case settings
    case back
}

final class FeedDetailsViewModel: FeedDetailsViewModelProtocol, Routable {
    typealias Route = FeedDetailsRoute
    
    private let actionRelay = PublishRelay<FeedDetails.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<FeedDetails.Action> { actionRelay.asObserver() }
    
    init() {
        subscribeToActions()
    }
}

// MARK: - Actions

private extension FeedDetailsViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: FeedDetails.Action) {
        switch action {
        case .settingsTapped:
            routes.accept(.settings)
        case .backTapped:
            routes.accept(.back)
        }
    }
}
