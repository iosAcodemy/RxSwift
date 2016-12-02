//: [Wstecz](@previous)
/*:
 ## Skip
 suppress the first n items emitted by an Observable
 [docs & marbles](http://reactivex.io/documentation/operators/skip.html)
*/

import Foundation
import RxSwift

example("Przykład - skip") { _ in
    Observable.from([1, 2, 3, 4, 5])
        .skip(1)
        .debug("")
        .subscribe()
}

//: [Dalej](@next)
