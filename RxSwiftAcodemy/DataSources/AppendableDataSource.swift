//
//  AppendableDataSource.swift
//  FunctionalMarvel
//
//  Created by Segii Shulga on 11/21/15.
//  Copyright © 2015 Sergey Shulga. All rights reserved.
//

import UIKit
import RxSwift

class AppendableDataSource<T>: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    var titleForHeaderInSection: ((UITableView, Int) -> String?)?
    var cellDeleted: ((UITableView, IndexPath) -> ())?
    
    fileprivate(set) var items:[T]
    fileprivate let cellFactory:(UITableView, IndexPath, T) -> UITableViewCell
    
    // MARK: - Initialization
    
    init(items:[T], cellFactory:@escaping (UITableView, IndexPath, T) -> UITableViewCell, cellDeleted: ((UITableView, IndexPath) -> ())? = nil) {
        self.cellFactory = cellFactory
        self.cellDeleted = cellDeleted
        self.items = items
    }
    
    // MARK: - Public API
    
    func appendItems(_ animation: UITableViewRowAnimation, tableView: UITableView, items: [T]) {
        if items.isEmpty { return }
        
        if self.items.count > 0 {
            insertItems(animation, tableView: tableView, items: items)
        } else {
            setItems(tableView, items: items)
        }
    }
    
    func reset(_ tableView: UITableView) {
        items.removeAll()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellFactory(tableView, indexPath, items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeaderInSection?(tableView, section)
    }
    
    func setItems(_ tableView: UITableView, items: [T]) {
        self.items = items
        tableView.reloadData()
    }
    
    func insertItems(_ animation: UITableViewRowAnimation, tableView: UITableView, items: [T], startFromRow: Int = -1) {
        guard items.count > 0 else { return }
        
        let indexPathes = (self.items.count...(self.items.count + items.count - 1)).map { (i) -> IndexPath in
            return IndexPath(row: startFromRow > -1 ? i - (self.items.count - startFromRow) : i, section: 0)
        }
        
        self.items.append(contentsOf: items)
        tableView.insertRows(at: indexPathes, with:animation)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return cellDeleted != nil
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            cellDeleted?(tableView, indexPath)
            break
            
        default:
            return
        }
    }
}
