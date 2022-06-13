//  Created by Nick Sudibor on 10.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay

protocol OnboardingViewModelProtocol {
    var actions: AnyObserver<Onboarding.Action> { get }
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
    private let actionRelay = PublishRelay<Onboarding.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Onboarding.Action> { actionRelay.asObserver() }
    
    init() {
        subscribeToActions()
    }
}

// MARK: - Actions

private extension OnboardingViewModel {
    func subscribeToActions() {
        actionRelay
            .subscribe(onNext: { [weak self] in self?.processAction($0) })
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: Onboarding.Action) {
        switch action {
        case .enterPhoneTapped:
            break
        }
    }
}
