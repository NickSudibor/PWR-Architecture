//  Created by Nick Sudibor on 20.04.22.

import UIKit

protocol RouterTrait: Router {
    var factory: AnyFactory<Context> { get }
    var transitionType: TransitionType { get }
    var hostController: UIViewController? { get }
    var transitionService: TransitionServiceProtocol { get }
}

extension RouterTrait {
    var hostController: UIViewController? { nil }
    var transitionService: TransitionServiceProtocol { TransitionService() }
    
    func navigate(with context: Context) {
        let destinationController = factory.build(with: context)
        transitionService.performTransition(
            from: hostController,
            to: destinationController,
            with: transitionType
        )
    }
}
