//  Created by Nick Sudibor on 12.04.22.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let dependencyContainer: AppDependencyContainerProtocol = AppDependencyContainer.shared
    private var flowManager: AppFlowManagerProtocol!
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        flowManager = AppFlowManager(
            dependencyContainer: dependencyContainer,
            itemsRouter: .init(ItemsRouter(window: window))
        )
        dependencyContainer.start(with: launchOptions)
        flowManager.start()
        
        return true
    }
}

