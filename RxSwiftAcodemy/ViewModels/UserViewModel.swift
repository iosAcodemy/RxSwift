//
//  UserViewModel.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import RxSwift

class UserViewModel {
    
    let firstName = Variable("")
    let lastName = Variable("")
    
    init(user: User) {
        self.firstName.value = user.firstName
        self.lastName.value = user.lastName
    }
}