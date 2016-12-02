//
//  ListResult.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import Alamofire

public struct ListResult<T> {
    
    let count: Int
    let items: [T]
    
    init(count: Int, items: [T]) {
        self.count = count
        self.items = items
    }
}
