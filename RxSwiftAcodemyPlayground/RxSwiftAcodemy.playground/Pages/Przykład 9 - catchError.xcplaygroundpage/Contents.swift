//: [Wstecz](@previous)
/*:
 ## Catch
 recover from an onError notification by continuing the sequence without error
 [docs & marbles](http://reactivex.io/documentation/operators/catch.html)
*/

import Foundation
import RxSwift

example("Przykład - catchError") { _ in
    Observable.from([1, 2, 3, 4, 5])
        .do(onNext: { (value) in
            guard value < 5 else {
                let error = NSError(domain: "RxAcodemy", code: 0, userInfo: nil)
                throw error
            }
        })
        .catchErrorJustReturn(0)
        .debug("")
        .subscribe()
}

//: [Dalej](@next)
