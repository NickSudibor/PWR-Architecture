//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol ContainerController: UIViewController {
    var visibleController: UIViewController? { get }
    
    func push(_ controller: UIViewController, animated: Bool)
    func pop(animated: Bool)
}
