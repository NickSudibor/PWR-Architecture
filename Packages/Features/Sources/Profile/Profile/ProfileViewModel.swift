//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import Routing

protocol ProfileViewModelProtocol {
    var actions: AnyObserver<Profile.Action> { get }
}

enum ProfileRoute {
    case profileDetails
}

final class ProfileViewModel: ProfileViewModelProtocol, Routable {
    typealias Route = ProfileRoute
    
    private let actionRelay = PublishRelay<Profile.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Profile.Action> { actionRelay.asObserver() }
    
    init() {
        subscribeToActions()
    }
}

// MARK: - Actions

private extension ProfileViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: Profile.Action) {
        switch action {
        case .profileDetailsTapped:
            routes.accept(.profileDetails)
        }
    }
}
