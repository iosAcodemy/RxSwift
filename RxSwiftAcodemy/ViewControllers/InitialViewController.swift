//
//  InitialViewController.swift
//  RxSwiftAcodemy
//
//  Created by Tomasz Mędryk on 09/11/2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import UIKit
import RxSwift

final class InitialViewController: UIViewController {

    // MARK :- Properties

    @IBOutlet fileprivate weak var simpleFormButton: UIButton!
    @IBOutlet fileprivate weak var validatedFormButton: UIButton!
    @IBOutlet fileprivate weak var usersListButton: UIButton!

    fileprivate let disposeBag = DisposeBag()
    var nvc: UINavigationController?

    // MARK :- Initialization

    init() {
        super.init(nibName: "InitialViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK :- ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Acodemy"
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        configureButtons()
    }

    // MARK :- Private Methods

    private func configureButtons() {
        simpleFormButton.rx.tap.asObservable()
            .subscribe(onNext: { [unowned self] in
                self.presentSimpleFormViewController()
            })
            .addDisposableTo(disposeBag)

        validatedFormButton.rx.tap.asObservable()
            .subscribe(onNext: { [unowned self] in
                self.presentFormValidationViewController()
            })
            .addDisposableTo(disposeBag)

        usersListButton.rx.tap.asObservable()
            .subscribe(onNext: { [unowned self] in
                self.presentUsersListViewController()
            })
            .addDisposableTo(disposeBag)
    }

    private func presentSimpleFormViewController() {
        let viewModel = SimpleFormViewModel()
        let viewController = SimpleFormViewController(viewModel: viewModel)
        nvc?.show(viewController, sender: nil)
        
    }

    private func presentFormValidationViewController() {
        let viewModel = SignupViewModel()
        let viewController =  FormValidationViewController(viewModel: viewModel)
         nvc?.show(viewController, sender: nil)
    }

    private func presentUsersListViewController() {
        let viewModel = UsersViewModel()
        let viewController =  RandomUsersListViewController(viewModel: viewModel)
         nvc?.show(viewController, sender: nil)
    }
}
