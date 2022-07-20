//  Created by Nick Sudibor on 19.07.22.

import UIKit
import RxSwift
import RxRelay

// MARK: - Item

public struct RoutableItem<Route> {
    public let controller: UIViewController
    public let routes: Observable<Route>
    
    public init(controller: UIViewController, routes: Observable<Route>) {
        self.controller = controller
        self.routes = routes
    }
}

public struct NoRoute { }

// MARK: - Routable

public protocol Routable {
    associatedtype Route
    var routesObservable: Observable<Route> { get }
}

public extension Routable {
    var routes: PublishRelay<Route> {
        if let relay = objc_getAssociatedObject(self, &relayContext) as? PublishRelay<Route> {
            return relay
        }
        let newRelay = PublishRelay<Route>()
        objc_setAssociatedObject(self, &relayContext, newRelay, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return newRelay
    }
    
    var routesObservable: Observable<Route> { return routes.asObservable() }
}

private var relayContext: UInt8 = 0
