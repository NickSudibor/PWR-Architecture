//  Created by Nick Sudibor on 19.07.22.

import Foundation
import PWRFoundation
import Login
import Feed

final class Dependencies {
    private let resolver = Resolver.main
    
    func register() {
        let containers: [DependencyContainer] = [
            LoginDependencies(),
            FeedDependencies()
        ]
        containers.forEach { $0.register(using: resolver) }
    }
}
