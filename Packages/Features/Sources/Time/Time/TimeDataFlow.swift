//  Created by Nick Sudibor on 28.06.22.

import UIKit

enum Time {
    enum Action {
        case viewLoaded
    }
    
    struct State {
        let time: Date
        let partOfTheDay: PartOfTheDay
    }
    
    struct ViewState {
        let info: TimeInfoViewState
        let color: UIColor
    }
}
