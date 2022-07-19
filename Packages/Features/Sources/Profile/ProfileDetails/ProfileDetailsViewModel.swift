//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import Routing

protocol ProfileDetailsViewModelProtocol {
    var actions: AnyObserver<ProfileDetails.Action> { get }
}

enum ProfileDetailsRoute {
    case settings
    case back
}

final class ProfileDetailsViewModel: ProfileDetailsViewModelProtocol, Routable {
    typealias Route = ProfileDetailsRoute
    
    private let actionRelay = PublishRelay<ProfileDetails.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<ProfileDetails.Action> { actionRelay.asObserver() }
    
    init() {
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
            routes.accept(.settings)
        case .backTapped:
            routes.accept(.back)
        }
    }
}
