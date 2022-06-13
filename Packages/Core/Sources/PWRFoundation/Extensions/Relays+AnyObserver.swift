//  Created by Nick Sudibor on 10.06.22.

import Foundation
import RxSwift
import RxRelay

public extension PublishRelay {
    func asObserver() -> AnyObserver<Element> {
        return AnyObserver(eventHandler: { [weak self] event in
            switch event {
            case let .next(element):
                self?.accept(element)
            default:
                break
            }
        })
    }
}

public extension BehaviorRelay {
    func asObserver() -> AnyObserver<Element> {
        return AnyObserver(eventHandler: { [weak self] event in
            switch event {
            case let .next(element):
                self?.accept(element)
            default:
                break
            }
        })
    }
}
