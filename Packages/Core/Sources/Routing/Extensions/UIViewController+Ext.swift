//  Created by Nick Sudibor on 13.06.22.

import UIKit

public extension UIViewController {
    var containerController: ContainerController? {
        if let parent = parent, let container = parent as? ContainerController {
            return container
        } else {
            return nil
        }
    }
}
