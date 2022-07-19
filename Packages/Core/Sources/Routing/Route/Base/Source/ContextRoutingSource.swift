//  Created by Nick Sudibor on 15.06.22.

import UIKit

public final class ContextRoutingSource<ViewController: UIViewController & ContextCheckable>: RoutingSource {
    private let finder: FinderProtocol
    private let context: ViewController.Context
    
    public init(finder: FinderProtocol = Finder(), context: ViewController.Context) {
        self.finder = finder
        self.context = context
    }
    
    public func viewController() throws -> UIViewController {
        if let controller = finder.findController(ofType: ViewController.self, with: context) {
            return controller
        } else {
            throw RoutingError.controllerNotFound
        }
    }
}
