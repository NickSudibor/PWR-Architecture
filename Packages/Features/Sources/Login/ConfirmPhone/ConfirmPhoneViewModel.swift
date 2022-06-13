//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol ConfirmPhoneViewModelProtocol {
    var actions: AnyObserver<ConfirmPhone.Action> { get }
}

final class ConfirmPhoneViewModel: ConfirmPhoneViewModelProtocol {
    private let actionRelay = PublishRelay<ConfirmPhone.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<ConfirmPhone.Action> { actionRelay.asObserver() }
    
    init() {
        subscribeToActions()
    }
}

// MARK: - Actions

private extension ConfirmPhoneViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: ConfirmPhone.Action) {
        switch action {
        case .continueTapped:
            break
        }
    }
}
