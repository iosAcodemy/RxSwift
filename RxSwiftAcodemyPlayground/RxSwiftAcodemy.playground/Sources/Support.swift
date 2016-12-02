import Foundation
import RxSwift

public func example(_ description: String, action: (Void) -> Void) {
    printExampleHeader(description)
    action()
}

public func printExampleHeader(_ description: String) {
    print("\n--- \(description) ---")
}

public enum TestError: Swift.Error {
    case test
}

public func getUserName(userId: Int) -> Observable<String> {
    return Observable<String>.create { (observer) -> Disposable in
        
        print("Creating new network request...")
        
        switch userId {
        case 1: observer.onNext("John")
        case 2: observer.onNext("Will")
        case 3: observer.onNext("Mike")
        default:
            let error = NSError(domain: "Acodemy", code: 0, userInfo: ["error":" user not found."])
            observer.onError(error)
        }
        
        observer.onCompleted()
        
        return Disposables.create {
            print("anulowanie zapytania. zwolnienie zasobów")
        }
    }
}
