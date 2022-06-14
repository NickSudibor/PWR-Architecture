//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol FeedDetailsViewModelProtocol {
    var actions: AnyObserver<FeedDetails.Action> { get }
}

final class FeedDetailsViewModel: FeedDetailsViewModelProtocol {
    private let router: FeedDetailsRouter
    
    private let actionRelay = PublishRelay<FeedDetails.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<FeedDetails.Action> { actionRelay.asObserver() }
    
    init(router: FeedDetailsRouter) {
        self.router = router
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
            router.routeToSettings()
        case .backTapped:
            router.routeBack()
        }
    }
}
