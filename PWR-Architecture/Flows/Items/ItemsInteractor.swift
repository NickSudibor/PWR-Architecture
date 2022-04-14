//  Created by Nick Sudibor on 12.04.22.

import Foundation

protocol ItemsInteractorProtocol: AnyObject {
    func onViewLoaded()
}

final class ItemsInteractor {
    private let presenter: ItemsPresenterProtocol
    private let service: ItemsServiceProtocol
    
    private var items: [Item] = []
    
    init(presenter: ItemsPresenterProtocol, service: ItemsServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }
}

// MARK: - ItemsInteractorProtocol

extension ItemsInteractor: ItemsInteractorProtocol {
    func onViewLoaded() {
        service.getItems { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items = items
                self.presenter.presentItems(items)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
