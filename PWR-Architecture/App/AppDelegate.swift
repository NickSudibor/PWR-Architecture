//  Created by Nick Sudibor on 12.04.22.

import UIKit
import Routing

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let router = Router()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        router.routeToOnboarding()
        
        return true
    }
}

