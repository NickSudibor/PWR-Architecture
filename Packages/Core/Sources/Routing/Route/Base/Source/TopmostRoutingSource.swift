//  Created by Nick Sudibor on 11.06.22.

import UIKit

public final class TopmostRoutingSource: RoutingSource {
    private let windowProvider: WindowProvider
    
    public init(windowProvider: WindowProvider = KeyWindowProvider()) {
        self.windowProvider = windowProvider
    }
    
    public func viewController() -> UIViewController? {
        return windowProvider.window.topmostController
    }
}
