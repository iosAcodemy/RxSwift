//
//  UsersViewModel.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import RxSwift

class UsersViewModel {

    // MARK :- Properties
    
    let users = Variable<[User]>([])

    // MARK :- Public
    
    func getUsers(_ limit: Int = 30) -> Observable<Void> {
        return apiManager.getUsers(limit).map { [weak self] list in
            self?.users.value = list.items
        }
    }
}
