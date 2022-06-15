//  Created by Nick Sudibor on 13.06.22.

import UIKit

public protocol ContainerController: UIViewController {
    var visibleController: UIViewController? { get }
    var controllers: [UIViewController] { get }
    
    func setControllers(_ controllers: [UIViewController], animated: Bool)
    func push(_ controller: UIViewController, animated: Bool)
    func pop(animated: Bool)
}
