//  Created by Nick Sudibor on 19.07.22.

import Foundation

public protocol ContextCheckable {
    associatedtype Context
    
    func isTarget(for context: Context) -> Bool
}
