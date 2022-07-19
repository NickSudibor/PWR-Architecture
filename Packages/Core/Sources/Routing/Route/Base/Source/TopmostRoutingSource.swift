//  Created by Nick Sudibor on 11.06.22.

import UIKit

public final class TopmostRoutingSource: RoutingSource {
    private let finder: FinderProtocol
    
    public init(finder: FinderProtocol = Finder()) {
        self.finder = finder
    }
    
    public func viewController() throws -> UIViewController {
        if let controller = finder.topmostController() {
            return controller
        } else {
            throw RoutingError.topmostControllerIsMissing
        }
    }
}
