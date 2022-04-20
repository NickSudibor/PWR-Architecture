//  Created by Nick Sudibor on 20.04.22.

import UIKit

protocol AppDependencyContainerProtocol: AnyObject {
    var authManager: AuthManagerProtocol { get }
    var userManager: UserManagerProtocol { get }
    
    func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

final class AppDependencyContainer: AppDependencyContainerProtocol {
    static let shared: AppDependencyContainerProtocol = AppDependencyContainer()
    
    let authManager: AuthManagerProtocol
    let userManager: UserManagerProtocol
    
    private init() {
        authManager = AuthManager()
        userManager = UserManager()
    }
    
    func start(with launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        
    }
}

