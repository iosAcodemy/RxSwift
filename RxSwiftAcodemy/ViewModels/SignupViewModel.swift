//
//  SignupViewModel.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 09.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxOptional

class SignupViewModel {


    // TASK 1a


    fileprivate let validationService = ValidationService()
//    Odkomentować po zrobieniu TASKa 1a
//    lazy var usernameValidation: Observable<ValidationResult> = { [unowned self] in
//        return self.username.asObservable()
//            .filterNil()
//            .map { self.validationService.validateUserName($0) }
//            .shareReplay(1)
//            .skip(1)
//        }()

    // TASK 3b

    // MARK: - Public

    func clearForm() {
//        Odkomentować po zrobieniu TASKa 1a
//        username.value = nil
//        password.value = nil
//        retypedPassword.value = nil
    }
}
