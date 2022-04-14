//  Created by Nick Sudibor on 14.04.22.

import Foundation

protocol ItemsServiceProtocol: AnyObject {
    func getItems(completion: @escaping (Result<[Item], Error>) -> ())
}

final class ItemsService: ItemsServiceProtocol {
    func getItems(completion: @escaping (Result<[Item], Error>) -> ()) {
        let result = [
            Item(id: "ID1", name: "Item 1", description: "First Item", creationDate: Date()),
            Item(id: "ID2", name: "Item 2", description: "Second Item", creationDate: Date()),
            Item(id: "ID3", name: "Item 3", description: "Third Item", creationDate: Date())
        ]
        completion(.success(result))
    }
}
