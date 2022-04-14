//  Created by Nick Sudibor on 12.04.22.

import Foundation

protocol ItemsPresenterProtocol: AnyObject {
    
}

final class ItemsPresenter {
    weak var controller: ItemsControllerProtocol?
}

// MARK: - ItemsPresenterProtocol

extension ItemsPresenter: ItemsPresenterProtocol {
    
}
