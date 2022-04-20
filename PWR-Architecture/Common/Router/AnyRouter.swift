//  Created by Nick Sudibor on 20.04.22.

import Foundation

final class AnyRouter<Context>: Router {
    private let _navigate: (Context) -> Void
    
    init<Concrete: Router>(_ concrete: Concrete) where Concrete.Context == Context {
        _navigate = concrete.navigate(with:)
    }
    
    func navigate(with context: Context) {
        _navigate(context)
    }
}
