//  Created by Nick Sudibor on 19.07.22.

import Foundation

public protocol DependencyContainer {
    func register(using resolver: Resolver)
}
