//  Created by Nick Sudibor on 28.06.22.

import Foundation
import PWRFoundation
import RxSwift
import RxRelay
import RxCocoa

protocol TimeViewModelProtocol: AnyObject {
    var actions: AnyObserver<Time.Action> { get }
}

final class TimeViewModel: TimeViewModelProtocol {
    private let presenter: TimePresenterProtocol
    
    private let actionsRelay = PublishRelay<Time.Action>()
    private let disposeBag = DisposeBag()
    
    var actions: AnyObserver<Time.Action> { actionsRelay.asObserver() }
    
    init(presenter: TimePresenterProtocol) {
        self.presenter = presenter
        bindActions()
    }
}
    
// MARK: - State
    
private extension TimeViewModel {
    func updateState() {
        let currentTime = Date()
        let state = Time.State(
            time: currentTime,
            partOfTheDay: partOfTheDay(from: currentTime)
        )
        presenter.state.onNext(state)
    }
}
    
// MARK: - Actions
    
private extension TimeViewModel {
    func bindActions() {
        actionsRelay
            .bind(onNext: processAction(_:))
            .disposed(by: disposeBag)
    }
    
    func processAction(_ action: Time.Action) {
        switch action {
        case .viewLoaded:
            updateState()
        }
    }
}

// MARK: - Time Analyzing

private extension TimeViewModel {
    func partOfTheDay(from time: Date) -> PartOfTheDay {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: time)
        switch hour {
        case (0 ..< 6):
            return .night
        case (6 ..< 12):
            return .morning
        case (12 ..< 18):
            return .day
        case (16 ..< 24):
            return .evening
        default:
            return .night
        }
    }
}
