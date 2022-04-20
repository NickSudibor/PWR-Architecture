//  Created by Nick Sudibor on 20.04.22.

import UIKit

final class ItemsRouter: RouterTrait {
    typealias Context = Void
    
    private let window: UIWindow
    private let navigationController: UINavigationController = .init()
    
    let factory: AnyFactory<Void> = .init(ItemsFactory())
    var transitionType: TransitionType { .setAsRootInNavigationController(navigationController, onWindow: window) }
    
    init(window: UIWindow) {
        self.window = window
    }
}
