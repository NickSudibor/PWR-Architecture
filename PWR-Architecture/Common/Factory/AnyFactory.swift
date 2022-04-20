//  Created by Nick Sudibor on 20.04.22.

import UIKit

final class AnyFactory<Context>: Factory {
    private let _build: (Context) -> UIViewController
    
    init<Concrete: Factory>(_ concrete: Concrete) where Concrete.Context == Context {
        _build = concrete.build(with:)
    }
    
    func build(with context: Context) -> UIViewController {
        _build(context)
    }
}
