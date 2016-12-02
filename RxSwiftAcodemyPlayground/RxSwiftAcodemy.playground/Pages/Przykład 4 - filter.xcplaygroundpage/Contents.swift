//: [Wstecz](@previous)
/*:
 ## Filter
 emit only those items from an Observable that pass a predicate test
 [docs & marbles](http://reactivex.io/documentation/operators/filter.html)
*/

import Foundation
import RxSwift

example("Przykład - filter") { _ in
    Observable.from([1, 2, 3, 4, 5])
        .filter { $0 > 3 }
        .debug("")
        .subscribe()
}

//: [Dalej](@next)
