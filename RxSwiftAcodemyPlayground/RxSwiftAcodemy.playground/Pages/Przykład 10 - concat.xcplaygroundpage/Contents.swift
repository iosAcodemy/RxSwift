//: [Wstecz](@previous)
/*:
 ## Concat
 emit the emissions from two or more Observables without interleaving them
 [docs & marbles](http://reactivex.io/documentation/operators/concat.html)
*/

import Foundation
import RxSwift

example("concat") {
    let disposeBag = DisposeBag()
    
    let subject1 = BehaviorSubject(value: "1")
    let subject2 = BehaviorSubject(value: "A")
    
    Observable.of(subject1, subject2).concat()
        .debug("")
        .subscribe()
        .addDisposableTo(disposeBag)
    
    subject1.onNext("2")
    subject1.onNext("3")
    
    subject2.onNext("I would be ignored")
    subject2.onNext("B")
    
    subject1.onCompleted()
    
    subject2.onNext("C")
}

//: [Dalej](@next)
