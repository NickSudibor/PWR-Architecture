//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import Routing

protocol EnterPhoneViewModelProtocol {
    var actions: AnyObserver<EnterPhone.Action> { get }
}

enum EnterPhoneRoute {
    case `continue`
}

final class EnterPhoneViewModel: EnterPhoneViewModelProtocol, Routable {
    typealias Route = EnterPhoneRoute
    
    private let actionRelay = PublishRelay<EnterPhone.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<EnterPhone.Action> { actionRelay.asObserver() }
    
    init() {
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
        case .continueTapped:
            routes.accept(.continue)
        }
    }
}
