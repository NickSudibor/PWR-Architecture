//  Created by Nick Sudibor on 12.04.22.

import UIKit

final class ItemsFactory: FactoryTrait {
    typealias Context = Void
    
    func build(with context: Void) -> UIViewController {
        let presenter = ItemsPresenter()
        let interactor = ItemsInteractor(
            presenter: presenter,
            service: ItemsService()
        )
        let controller = ItemsController(interactor: interactor)
        presenter.controller = controller
        return controller
    }
}
