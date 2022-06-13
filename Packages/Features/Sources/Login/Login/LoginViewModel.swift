//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol LoginViewModelProtocol {
    var actions: AnyObserver<Login.Action> { get }
}

final class LoginViewModel: LoginViewModelProtocol {
    private let actionRelay = PublishRelay<Login.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Login.Action> { actionRelay.asObserver() }
    
    init() {
        subscribeToActions()
    }
}

// MARK: - Actions

private extension LoginViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: Login.Action) {
        switch action {
        case .loginTapped:
            break
        }
    }
}
