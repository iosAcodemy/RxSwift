//
//  Alamofire+Extensions.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import Alamofire

public protocol ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: AnyObject)
}

public protocol ResponseCollectionSerializable {
    static func collection(response: HTTPURLResponse, representation: AnyObject) -> [Self]
}

public enum APIErrorCode: Int {
    case jsonSerializationFailed
}

extension DataRequest {
    public func responseListResult<T: ResponseCollectionSerializable>(completionHandler: @escaping (DataResponse<ListResult<T>>)->Void) -> Self {
        let responseSerializer = DataResponseSerializer<ListResult<T>> { request, response, data, error in
            
            if let error = error { return .failure(error) }
         
            let result = Request.serializeResponseJSON(options: .allowFragments, response: response, data: data, error: error)
            switch result {
            case .success(let value):
                if let response = response, let value = value as? [String: AnyObject],
                    let listResult: ListResult<T> = self.listResult(response, value: value) {
                    return .success(listResult)
                }
                
                let failureReason = "Response collection could not be serialized due to nil response"
                let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                let error = NSError(domain: "com.10clouds.rxswiftacodemy", code: APIErrorCode.jsonSerializationFailed.rawValue, userInfo: userInfo)

                return .failure(error)
            case .failure(let error):
                return .failure(error)
            }
        }
    
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
    fileprivate func listResult<T: ResponseCollectionSerializable>(_ response: HTTPURLResponse?, value: [String: AnyObject]) -> ListResult<T>? {
        if let response = response, let objectsArray = value["results"] as? [[String: AnyObject]],
            let infoDictionary = value["info"] as? [String: AnyObject] {
            let count = infoDictionary["results"] as? Int ?? 0
            let items: [T] = T.collection(response: response, representation: objectsArray as AnyObject)
            return ListResult(count: count, items: items)
        }
        
        return nil
    }
}
