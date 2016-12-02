//
//  ValidationService.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 09.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation

enum ValidationResult: Equatable {
    case valid
    case invalid(String)
}

class ValidationService {

    func validateUserName(_ name: String) -> ValidationResult {
        if name.characters.count > 4 {
            return .valid
        }
        return .invalid("Name should have at least 5 characters.")

    }

    func validatePassword(_ password: String) -> ValidationResult {
        // TASK 3a
        return .valid
    }

    func validateSecondPassword(_ password: String?, secondPassword: String?) -> ValidationResult {
        guard let password = password, let secondPassword = secondPassword,
              password == secondPassword else {
            return .invalid("Passwords must match.")
        }
        return .valid
    }

}

extension ValidationResult {
    static func ==(lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        switch (lhs, rhs) {
        case (.valid, .valid): return true
        case (.invalid, .invalid): return true
        default: return false
        }
    }
}




