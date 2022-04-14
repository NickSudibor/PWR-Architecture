//  Created by Nick Sudibor on 12.04.22.

import Foundation

protocol ItemsPresenterProtocol: AnyObject {
    func presentItems(_ items: [Item])
    func presentError(_ error: Error)
}

final class ItemsPresenter {
    private let dateFormatter: DateFormatter
    
    weak var controller: ItemsControllerProtocol?
    
    init(dateFormatter: DateFormatter = DateFormatter.basic) {
        self.dateFormatter = dateFormatter
    }
}

// MARK: - ItemsPresenterProtocol

extension ItemsPresenter: ItemsPresenterProtocol {
    func presentItems(_ items: [Item]) {
        let viewModels: [ItemViewModel] = items.map {
            let title = "\($0.id): \($0.name) - \($0.description)"
            let dateString = "Created at \(dateFormatter.string(from: $0.creationDate))"
            return ItemViewModel(title: title, dateString: dateString)
        }
        controller?.displayItems(viewModels)
    }
    
    func presentError(_ error: Error) {
        
    }
}
