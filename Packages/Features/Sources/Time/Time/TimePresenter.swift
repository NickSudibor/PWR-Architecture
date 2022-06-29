//  Created by Nick Sudibor on 28.06.22.

import Foundation
import UIKit
import RxSwift
import RxRelay

protocol TimePresenterProtocol: AnyObject {
    var state: AnyObserver<Time.State> { get }
}

final class TimePresenter: TimePresenterProtocol {
    private let stateRelay = PublishRelay<Time.State>()
    private let disposeBag = DisposeBag()
    
    var state: AnyObserver<Time.State> { stateRelay.asObserver() }
    weak var controller: TimeControllerProtocol?
    
    init() {
        bindState()
    }
}

// MARK: - View State

private extension TimePresenter {
    func bindState() {
        stateRelay
            .compactMap { [weak self] in self?.viewState(from: $0) }
            .subscribe(onNext: { [weak self] in self?.controller?.viewState.onNext($0) })
            .disposed(by: disposeBag)
    }
    
    private func viewState(from state: Time.State) -> Time.ViewState {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "en_US")
        let timeString = formatter.string(from: state.time)
        
        let message: String
        let color: UIColor
        switch state.partOfTheDay {
        case .morning:
            message = "Good Morning 🌞"
            color = UIColor(red: 255/255, green: 172/255, blue: 0/255, alpha: 1)
        case .day:
            message = "Time To Be Productive 💪"
            color = UIColor(red: 255/255, green: 0/255, blue: 124/255, alpha: 1)
        case .evening:
            message = "Party Time 🎉"
            color = UIColor(red: 255/255, green: 0/255, blue: 124/255, alpha: 1)
        case .night:
            message = "Sleep Well 😴"
            color = UIColor(red: 219/255, green: 0/255, blue: 255/255, alpha: 1)
        }
        
        let viewState = Time.ViewState(
            info: TimeInfoViewState(title: timeString, description: message),
            color: color
        )
        return viewState
    }
}
