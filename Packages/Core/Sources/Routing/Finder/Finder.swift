//  Created by Nick Sudibor on 15.06.22.

import UIKit

public protocol FinderProtocol {
    func findController<ViewController: UIViewController>(
        ofType controllerType: ViewController.Type
    ) -> ViewController?
    
    func findController<ViewController: UIViewController & ContextCheckable>(
        ofType controllerType: ViewController.Type,
        with context: ViewController.Context
    ) -> ViewController?
}

public protocol ContextCheckable {
    associatedtype Context
    
    func isTarget(for context: Context) -> Bool
}

public final class Finder: FinderProtocol {
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
    
    public func findController<ViewController: UIViewController & ContextCheckable>(
        ofType controllerType: ViewController.Type,
        with context: ViewController.Context
    ) -> ViewController? {
        let controller = windowProvider.window.findController(using: {
            guard let typedController = $0 as? ViewController else { return false }
            return typedController.isTarget(for: context)
        })
        return controller as? ViewController
    }
}
