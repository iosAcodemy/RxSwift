//
//  SimpleBindingsViewController.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 09.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class SimpleFormViewController: UIViewController {
    
    // MARK :- Properties
    
    @IBOutlet weak var card: UIView!
    @IBOutlet fileprivate weak var fullNameLabel: UILabel!
    @IBOutlet fileprivate weak var genderLabel: UILabel!
    
    @IBOutlet fileprivate weak var firstNameTextField: UITextField!
    @IBOutlet fileprivate weak var lastNameTextField: UITextField!
    
    @IBOutlet fileprivate weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet fileprivate weak var birthLabel: UILabel!
    
    @IBOutlet fileprivate weak var birthDatePicker: UIDatePicker! {
        didSet { birthDatePicker.datePickerMode = .date }
    }
    
    @IBOutlet weak var clearFormButton: UIButton!
    
    fileprivate var viewModel: SimpleFormViewModel
    fileprivate let disposeBag = DisposeBag()
    
    // MARK :- Initialization
    
    init(viewModel: SimpleFormViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SimpleFormViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK :- ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindUI()
        setupUI()
    }
    
    // MARK :- Private
    
    fileprivate func setupUI() {
        title = "Simple Form"
        birthDatePicker.setValue(UIColor.tenCloudsGreen(), forKey: "textColor")
        card.layer.borderWidth = 1.0
        card.layer.borderColor = UIColor.tenCloudsGreen().cgColor
        card.layer.cornerRadius = 8
    }
    
    fileprivate func bindViewModel() {
        bindLabels()
        bindTextFields()
        bindSegmentedControl()
        bindDatePicker()
    }
    
    fileprivate func bindLabels() {
        viewModel.fullName.asObservable()
            .bindTo(fullNameLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        viewModel.formattedGender.asObservable()
            .bindTo(genderLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        viewModel.formattedBirthDate.asObservable()
            .bindTo(birthLabel.rx.text)
            .addDisposableTo(disposeBag)
    }
    
    // TASK 1
    // Add two way bindings
    
    fileprivate func bindTextFields() {
    }
    
    // TASK 2
    // Bind choosen segment to genderIndex
    // Format the gender in ViewModel
    
    fileprivate func bindSegmentedControl() {
    }
    
    // TASK 3
    // Bind datePicker to birthDate
    
    fileprivate func bindDatePicker() {
    }
    
    // TASK 4
    // Add button to clear form.
    // Subscribe to tap event - reset values in ViewModel.
    
    fileprivate func bindUI() {
    }
    
}
