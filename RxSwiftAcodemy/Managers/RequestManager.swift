//
//  RequestManager.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 17.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum APIError: Error {
    case parseError
}

final class RequestManager {
    fileprivate var manager = SessionManager()
    
    // MARK: - Initialization
    
    init() {
        manager = SessionManager()
    }
    
    // MARK: - Public api
    
    func fetchCollection<T: ResponseCollectionSerializable>(_ apiMethod: APIMethod, params: [String: AnyObject]?)
        -> Observable<ListResult<T>> {
            let url = urlForAPIMethod(apiMethod)
            return fetchCollection(url, params: params)
    }

    func fetchCollection<T: ResponseCollectionSerializable>(_ url: String, params: [String: AnyObject]?)
        -> Observable<ListResult<T>> {
            return Observable.create { observer in
                let request = self.manager.request(url, method: .get, parameters: params, headers: nil)
                    .responseListResult(completionHandler: { (response: DataResponse<ListResult<T>>) in
                        switch response.result {
                        case .success(let object):
                            observer.onNext(object)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                })
                
                return Disposables.create {
                    request.cancel()
                }
            }
    }
    
    // MARK: - Private
    
    fileprivate func urlForAPIMethod(_ apiMethod: APIMethod) -> String {
        return "\(kAPIBaseURL)/\(apiMethod.urlString)"
    }
    
    fileprivate class func serverTrustPolicies() -> [String: ServerTrustPolicy] {
        return ["api.randomuser.me": .disableEvaluation]
    }
}
