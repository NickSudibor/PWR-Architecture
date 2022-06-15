//  Created by Nick Sudibor on 15.06.22.

import UIKit

public protocol ClassFinderProtocol {
    func findController<ViewController: UIViewController>(
        ofType controllerType: ViewController.Type
    ) -> ViewController?
}

public final class ClassFinder: ClassFinderProtocol {
    private let windowProvider: WindowProvider
    
    public init(windowProvider: WindowProvider = KeyWindowProvider()) {
        self.windowProvider = windowProvider
    }
    
    public func findController<ViewController: UIViewController>(
        ofType controllerType: ViewController.Type
    ) -> ViewController? {
        let controller = windowProvider.window.findController(using: {
            return $0 is ViewController
        })
        return controller as? ViewController
    }
}
