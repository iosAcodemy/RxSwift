//
//  User.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import Decodable

final class User {
    let gender: String
    let firstName: String
    let lastName: String
    let nationality: String
    
    init(gender: String, firstName: String, lastName: String, nationality: String) {
        self.gender = gender
        self.firstName = firstName
        self.lastName = lastName
        self.nationality = nationality
    }
}

extension User: Decodable {
    static func decode(_ json: Any) throws -> User {
        
        return try User(gender: json => "gender",
                        firstName: json => "name" => "first",
                        lastName: json => "name" => "last",
                        nationality: json => "nat")
    }
}

extension User: ResponseCollectionSerializable {
    static func collection(response: HTTPURLResponse, representation: AnyObject) -> [User] {
        var users: [User] = []
        
        let parseUsers: ([[String: AnyObject]]) -> (Void) = { usersArray in
            for userRepresentation in usersArray {
                if let user = try? User.decode(userRepresentation as AnyObject) {
                    users.append(user)
                }
            }
        }
        
        if let results = representation as? [[String: AnyObject]] {
            parseUsers(results)
        }
       
        return users
    }
}
