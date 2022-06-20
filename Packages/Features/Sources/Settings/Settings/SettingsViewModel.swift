//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol SettingsViewModelProtocol {
    var actions: AnyObserver<Settings.Action> { get }
}

final class SettingsViewModel: SettingsViewModelProtocol {
    private let router: SettingsRouter
    
    private let actionRelay = PublishRelay<Settings.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Settings.Action> { actionRelay.asObserver() }
    
    init(router: SettingsRouter) {
        self.router = router
        subscribeToActions()
    }
}

// MARK: - Actions

private extension SettingsViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: Settings.Action) {
        switch action {
        case .profileTapped:
            router.routeToProfileFromSettings()
        case .closeTapped:
            router.dismiss()
        }
    }
}
