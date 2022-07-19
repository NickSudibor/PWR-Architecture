//  Created by Nick Sudibor on 19.07.22.

import Foundation

public enum RoutingResult {
    case success
    case failure(Error)
}

public enum RoutingError: Error {
    case topmostControllerIsMissing
    case containerControllerIsMissing
    case controllerNotFound
}
