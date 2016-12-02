//
//  RandomUsersListViewController.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import JGProgressHUD

class RandomUsersListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK :- Properties

    fileprivate let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    fileprivate let indicator = ActivityIndicator()
    
    fileprivate var disposeBag = DisposeBag()
    fileprivate var viewModel: UsersViewModel
    fileprivate var HUD: ProgressHUD!

    // MARK :- Initialization
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "RandomUsersListViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK :- ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindUI()
        bindViewModel()
        title = "Rx Data Source"
    }
    
    // MARK :- Private
    
    fileprivate func bindUI() {
        HUD = ProgressHUD(view: view)
    }
    
    fileprivate func bindViewModel() {
        //TODO TASK 1
    }

    fileprivate func configureTableView() {
        tableView.registerReusableCell(UserTableViewCell.self)
    }
}
