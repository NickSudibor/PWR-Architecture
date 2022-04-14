//  Created by Nick Sudibor on 12.04.22.

import Foundation

protocol ItemsInteractorProtocol: AnyObject {
    func onViewLoaded()
}

final class ItemsInteractor {
    private let presenter: ItemsPresenterProtocol
    
    init(presenter: ItemsPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - ItemsInteractorProtocol

extension ItemsInteractor: ItemsInteractorProtocol {
    func onViewLoaded() {
        
    }
}
