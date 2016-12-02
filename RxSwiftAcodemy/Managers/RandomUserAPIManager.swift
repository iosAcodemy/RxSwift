//
//  RandomUserAPIManager.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import RxSwift

let apiManager = RandomUserAPIManager(requestManager: RequestManager())

class RandomUserAPIManager {
    
    // MARK :- Variables
    
    fileprivate let requestManager: RequestManager!
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    // MARK :- Public
    
    func getUsers(_ count: Int) -> Observable<ListResult<User>> {
        let apiMethod: APIMethod = .users
        let params  = ["results": count]
        return requestManager.fetchCollection(apiMethod, params: params as [String : AnyObject]?)
    }
}
