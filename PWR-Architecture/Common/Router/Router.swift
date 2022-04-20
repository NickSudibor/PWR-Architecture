//  Created by Nick Sudibor on 20.04.22.

import Foundation

protocol Router: AnyObject {
    associatedtype Context
    
    func navigate(with context: Context)
}

extension Router where Context == Void {
    func navigate() {
        navigate(with: Void())
    }
}
