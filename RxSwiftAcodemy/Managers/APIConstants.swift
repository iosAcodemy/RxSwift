//
//  APIConstants.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation

let kAPIBaseURL = "http://api.randomuser.me/"

enum APIMethod {
    case users
    
    var urlString: String {
        switch self {
        case .users: return "?seed=test"
        }
    }
}
