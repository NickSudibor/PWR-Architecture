//  Created by Nick Sudibor on 20.04.22.

import Foundation

protocol FactoryTrait: Factory {
    var dependencyContainer: AppDependencyContainerProtocol { get }
}

extension FactoryTrait {
    var dependencyContainer: AppDependencyContainerProtocol { AppDependencyContainer.shared }
}
