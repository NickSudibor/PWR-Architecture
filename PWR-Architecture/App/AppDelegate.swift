//  Created by Nick Sudibor on 12.04.22.

import UIKit
import PWRFoundation
import Routing
import Login

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    @LazyInjected private var loginRouter: AnyRouter<LoginStartingPoint>
    
    private let dependencies = Dependencies()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        dependencies.register()
        
        loginRouter.process(.enterPhone)
        
        return true
    }
}

