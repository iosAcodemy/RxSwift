//
//  UserTableViewCell.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class UserTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    static var nib: UINib? {
        return UINib(nibName: String(describing: UserTableViewCell.self), bundle: nil)
    }
    
    fileprivate var disposeBag: DisposeBag!
    
    var viewModel: UserViewModel! {
        didSet {
            bindViewModel()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = nil
    }
    
    fileprivate func bindViewModel() {
        disposeBag = DisposeBag()
        //TODO: TASK 3
    }
}
