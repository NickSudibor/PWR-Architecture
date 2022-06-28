//  Created by Nick Sudibor on 28.06.22.

import Foundation
import UIKit

protocol TimePresenterProtocol {
    func viewState(from state: Time.State) -> Time.ViewState
}

final class TimePresenter: TimePresenterProtocol {
    func viewState(from state: Time.State) -> Time.ViewState {
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
            color = UIColor(red: 255/255, green: 172/255, blue: 0/255, alpha: 1)
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
