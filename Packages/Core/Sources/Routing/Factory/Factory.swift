//  Created by Nick Sudibor on 14.04.22.

import UIKit

public protocol Factory: AnyObject {
    associatedtype Context
    
    func build(with context: Context) -> UIViewController
}

public extension Factory where Context == Void {
    func build() -> UIViewController {
        build(with: Void())
    }
}

public extension Factory {
    func asAnyFactory() -> AnyFactory<Context> {
        AnyFactory(self)
    }
}

// MARK: - AnyFactory

public final class AnyFactory<Context>: Factory {
    private let _build: (Context) -> UIViewController
    
    init<Concrete: Factory>(_ concrete: Concrete) where Concrete.Context == Context {
        _build = concrete.build(with:)
    }
    
    public func build(with context: Context) -> UIViewController {
        _build(context)
    }
}
