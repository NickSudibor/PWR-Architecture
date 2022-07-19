//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import Routing

protocol SettingsViewModelProtocol {
    var actions: AnyObserver<Settings.Action> { get }
}

enum SettingsRoute {
    case close
}

final class SettingsViewModel: SettingsViewModelProtocol, Routable {
    typealias Route = SettingsRoute
    
    private let actionRelay = PublishRelay<Settings.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Settings.Action> { actionRelay.asObserver() }
    
    init() {
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
        case .closeTapped:
            routes.accept(.close)
        }
    }
}
