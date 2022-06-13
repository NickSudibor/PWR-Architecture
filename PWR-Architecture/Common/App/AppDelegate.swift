//  Created by Nick Sudibor on 12.04.22.

import UIKit
import Login

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let dependencyContainer: AppDependencyContainerProtocol = AppDependencyContainer.shared
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        window.rootViewController = OnboardingFactory().build()
        
        return true
    }
}

