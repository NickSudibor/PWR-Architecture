//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol EnterPhoneViewModelProtocol {
    var actions: AnyObserver<EnterPhone.Action> { get }
}

final class EnterPhoneViewModel: EnterPhoneViewModelProtocol {
    private let router: EnterPhoneRouter
    
    private let actionRelay = PublishRelay<EnterPhone.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<EnterPhone.Action> { actionRelay.asObserver() }
    
    init(router: EnterPhoneRouter) {
        self.router = router
        subscribeToActions()
    }
}

// MARK: - Actions

private extension EnterPhoneViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: EnterPhone.Action) {
        switch action {
        case .confirmTapped:
            router.routeToHome()
        case .backTapped:
            router.routeBack()
        }
    }
}