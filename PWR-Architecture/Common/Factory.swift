//  Created by Nick Sudibor on 14.04.22.

import UIKit

protocol Factory {
    associatedtype Context
    
    func build(with context: Context) -> UIViewController
}

extension Factory where Context == Void {
    func build() -> UIViewController {
        build(with: Void())
    }
}
