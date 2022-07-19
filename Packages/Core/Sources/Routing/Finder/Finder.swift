//  Created by Nick Sudibor on 19.07.22.

import UIKit

public protocol FinderProtocol {
    func topmostController() -> UIViewController?
    
    func findController<ViewController: UIViewController>(
        ofType controllerType: ViewController.Type
    ) -> ViewController?
    
    func findController<ViewController: UIViewController & ContextCheckable>(
        ofType controllerType: ViewController.Type,
        with context: ViewController.Context
    ) -> ViewController?
}

public final class Finder: FinderProtocol {
    private let windowProvider: WindowProvider
    private var window: UIWindow { windowProvider.window }
    
    public init(windowProvider: WindowProvider = KeyWindowProvider()) {
        self.windowProvider = windowProvider
    }
    
    public func topmostController() -> UIViewController? {
        guard let rootController = window.rootViewController else { return nil }
        var topController = rootController
        while true {
            if let presentedController = topController.presentedViewController, !presentedController.isBeingDismissed {
                topController = presentedController
            } else if let containerController = topController as? ContainerController,
                      let visibleController = containerController.visibleController {
                topController = visibleController
            } else {
                return topController
            }
        }
    }
}

// MARK: - Find

public extension Finder {
    func findController<ViewController: UIViewController>(
        ofType controllerType: ViewController.Type
    ) -> ViewController? {
        guard let rootController = window.rootViewController else { return nil }
        let controller = findController(startingFrom: rootController, using: {
            return $0 is ViewController
        })
        return controller as? ViewController
    }
    
    func findController<ViewController: UIViewController & ContextCheckable>(
        ofType controllerType: ViewController.Type,
        with context: ViewController.Context
    ) -> ViewController? {
        guard let rootController = window.rootViewController else { return nil }
        let controller = findController(startingFrom: rootController, using: {
            guard let typedController = $0 as? ViewController else { return false }
            return typedController.isTarget(for: context)
        })
        return controller as? ViewController
    }
    
    private func findController(
        startingFrom originController: UIViewController,
        using predicate: (UIViewController) -> Bool
    ) -> UIViewController? {
        if predicate(originController) {
            return originController
        }
        if let container = originController as? ContainerController {
            let results = container.controllers.compactMap { findController(startingFrom: $0, using: predicate) }
            if let result = results.first {
                return result
            }
        }
        if let presentedController = originController.presentedViewController, !presentedController.isBeingDismissed {
            if let result = findController(startingFrom: presentedController, using: predicate) {
                return result
            }
        }
        return nil
    }
}
