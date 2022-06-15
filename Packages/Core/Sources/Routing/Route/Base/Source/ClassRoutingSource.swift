//  Created by Nick Sudibor on 15.06.22.

import UIKit

public final class ClassRoutingSource<ViewController: UIViewController>: RoutingSource {
    private let finder: ClassFinderProtocol
    
    public init(finder: ClassFinderProtocol = ClassFinder()) {
        self.finder = finder
    }
    
    public func viewController() -> UIViewController? {
        return finder.findController(ofType: ViewController.self)
    }
}
