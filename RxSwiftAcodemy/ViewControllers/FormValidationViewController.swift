//
//  FormValidationViewController.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 09.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class FormValidationViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameValidationLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypedPasswordLabel: UILabel!
    @IBOutlet weak var retypedPasswordTextField: UITextField!
    @IBOutlet weak var passwordValidationLabel: UILabel!
    @IBOutlet weak var retypedPasswordValidationLabel: UILabel!

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var clearFormButton: UIButton!

    // MARK: Properties

    fileprivate var disposeBag = DisposeBag()

    fileprivate var viewModel: SignupViewModel

    // MARK: - Initialization

    init(viewModel: SignupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "FormValidationViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setupUI()
        bindViewModel()
    }

    // MARK :- Private

    func setupUI() {
        title = "Form Validation"
        usernameValidationLabel.isHidden = true
        passwordValidationLabel.isHidden = true
        retypedPasswordValidationLabel.isHidden = true
    }


    fileprivate func bindUI() {
        // TASK 5

        registerButton.rx.tap.subscribe(onNext: { [unowned self] in
                    self.showSuccessAlert()
                }).addDisposableTo(disposeBag)
    }

    fileprivate func bindViewModel() {
        // TASK 1b


        // TASK 2


        // TASK 3d


        // TASK 4

    }

    fileprivate func bindValidationResultToUI(_ result: Observable<ValidationResult>, label: UILabel) {
        // TASK 3c
    }

    fileprivate func showSuccessAlert() {
        let controller = UIAlertController(title: nil, message: "Jesteście Piękni!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true)
    }
}
