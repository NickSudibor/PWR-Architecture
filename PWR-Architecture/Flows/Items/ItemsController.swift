//  Created by Nick Sudibor on 12.04.22.

import UIKit

protocol ItemsControllerProtocol: AnyObject {
    
}

final class ItemsController: UIViewController {
    private let interactor: ItemsInteractorProtocol
    
    init(interactor: ItemsInteractorProtocol) {
        self.interactor = interactor
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - ItemsControllerProtocol

extension ItemsController: ItemsControllerProtocol {
    
}
