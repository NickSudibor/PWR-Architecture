//  Created by Nick Sudibor on 20.04.22.

import UIKit

protocol AppFlowManagerProtocol: AnyObject {
    func start()
}

final class AppFlowManager: AppFlowManagerProtocol {
    private let dependencyContainer: AppDependencyContainerProtocol
    private let itemsRouter: AnyRouter<Void>
    
    init(
        dependencyContainer: AppDependencyContainerProtocol,
        itemsRouter: AnyRouter<Void>
    ) {
        self.dependencyContainer = dependencyContainer
        self.itemsRouter = itemsRouter
    }
    
    func start() {
        itemsRouter.navigate()
    }
}
