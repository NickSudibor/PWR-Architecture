//  Created by Nick Sudibor on 15.06.22.

import UIKit

public final class ContextRoutingSource<ViewController: UIViewController & ContextCheckable>: RoutingSource {
    private let finder: ContextFinderProtocol
    private let context: ViewController.Context
    
    public init(finder: ContextFinderProtocol = ContextFinder(), context: ViewController.Context) {
        self.finder = finder
        self.context = context
    }
    
    public func viewController() -> UIViewController? {
        return finder.findController(ofType: ViewController.self, with: context)
    }
}
