//  Created by Nick Sudibor on 14.04.22.

import UIKit

protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseID: String {
        return String(describing: classForCoder())
    }
}

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }
extension UICollectionReusableView: ReusableView { }

// MARK: - UITableView

extension UITableView {
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseID)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(ofType type: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseID)
    }
    
    func dequeueCell<T: UITableViewCell>(ofType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("Class \(T.reuseID) is not registered in TableView")
        }
        return cell
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(ofType type: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseID) as? T else {
            fatalError("Class \(T.reuseID) is not registered in TableView")
        }
        return view
    }
}

// MARK: - CollectionView

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        register(type, forCellWithReuseIdentifier: T.reuseID)
    }
    
    func registerHeader<T: UICollectionReusableView>(ofType type: T.Type) {
        register(type, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseID)
    }
    
    func registerFooter<T: UICollectionReusableView>(ofType type: T.Type) {
        register(type, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseID)
    }
    
    func dequeueCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("Class \(T.reuseID) is not registered in CollectionView")
        }
        return cell
    }
    
    func dequeueHeader<T: UICollectionReusableView>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("Class \(T.reuseID) is not registered in CollectionView")
        }
        return header
    }
    
    func dequeueFooter<T: UICollectionReusableView>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("Class \(T.reuseID) is not registered in CollectionView")
        }
        return footer
    }
}
