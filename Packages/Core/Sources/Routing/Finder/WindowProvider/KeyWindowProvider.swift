//  Created by Nick Sudibor on 11.06.22.

import UIKit

public final class KeyWindowProvider: WindowProvider {
    public var window: UIWindow {
        let keyWindow: UIWindow?
        if #available(iOS 13, *) {
            keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        } else {
            keyWindow = UIApplication.shared.keyWindow
        }
        guard let window = keyWindow else {
            assertionFailure("Application does not have key window")
            return UIWindow()
        }
        return window
    }
    
    public init() { }
}
