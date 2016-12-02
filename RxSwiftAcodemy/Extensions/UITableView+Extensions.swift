//
//  UITableView+Extensions.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol Reusable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib? { return nil }
}

extension UITableView {
    func deselectSelectedCell() {
        guard let selectedIndexPath = indexPathForSelectedRow else { return }
        deselectRow(at: selectedIndexPath, animated: true)
    }
}

extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
    }
}

// MARK :- Rx next page trigger

extension UITableView {
    var rx_nextPageTrigger: Observable<Void> {
        return self
            .rx.contentOffset
            .flatMapLatest { [unowned self] (offset) -> Observable<Void> in
                //trigger next page when content is scrolled further than 95% of the list
                let shouldTrigger =  offset.y + self.frame.size.height > self.contentSize.height * 0.95
                if shouldTrigger {
                    //let obs: Observable<Void> = Observable<Void>();
                    //return obs
                    return Observable.just()
                } else {
                    return Observable.empty()
                }
        }
    }
}
