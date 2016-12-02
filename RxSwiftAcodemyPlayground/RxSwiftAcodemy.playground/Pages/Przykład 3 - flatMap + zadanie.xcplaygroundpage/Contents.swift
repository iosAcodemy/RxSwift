//: [Wstecz](@previous)
/*:
 ## FlatMap
 transform the items emitted by an Observable into Observables, then flatten the emissions from those into a single Observable
 [docs & marbles](http://reactivex.io/documentation/operators/flatmap.html)
 */

import Foundation
import RxSwift

//example("Przykład - flatMap") { _ in
//
//    Observable.from([1, 2, 3])
//        .flatMap { (value) -> Observable<Int> in
//            var values = [Int]()
//            
//            for i in 1...value {
//                values.append(i)
//            }
//         return Observable.from(values)
//        }
//        .debug("")
//        .subscribe()
//}


/*:
 ### Zadanie 3:
 Wykorzystaj listę userIds, flatMap oraz funkcję getUserName(userId: Int) -> Observable<String> do pobrania nazw użytkoników
*/

example("zadanie 3") { _ in
    let userIds = [1, 2, 3]

}

//: [Dalej](@next)
