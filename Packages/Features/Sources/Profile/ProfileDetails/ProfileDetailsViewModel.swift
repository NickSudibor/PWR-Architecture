//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol ProfileDetailsViewModelProtocol {
    var actions: AnyObserver<ProfileDetails.Action> { get }
}

final class ProfileDetailsViewModel: ProfileDetailsViewModelProtocol {
    private let router: ProfileDetailsRouter
    
    private let actionRelay = PublishRelay<ProfileDetails.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<ProfileDetails.Action> { actionRelay.asObserver() }
    
    init(router: ProfileDetailsRouter) {
        self.router = router
        subscribeToActions()
    }
}

// MARK: - Actions

private extension ProfileDetailsViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: ProfileDetails.Action) {
        switch action {
        case .settingsTapped:
            router.routeToSettings()
        case .backTapped:
            router.routeBack()
        }
    }
}
