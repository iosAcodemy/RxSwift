//: [Wstecz](@previous)
/*:
 ## Merge
 combine multiple Observables into one by merging their emissions
 [docs & marbles](http://reactivex.io/documentation/operators/merge.html)
*/

import Foundation
import RxSwift

example("merge") {
    
//    let subject1 = PublishSubject<String>()
//    let subject2 = PublishSubject<String>()
//    
//    Observable.of(subject1, subject2)
//        .merge()
//        .debug("")
//        .subscribe()
//    
//    subject1.onNext("🅰️")
//    subject1.onNext("🅱️")
//    subject2.onNext("①")
//    subject2.onNext("②")
//    subject1.onNext("🆎")
//    subject2.onNext("③")
}

/*:
 ## Zadanie 6:
 Zmodyfikuj rozwiązanie z zadania nr 4 tak, aby alert był wyświetlany w przypadku, gdy poziom w jednym ze zbiorników (nie łączny poziom) przekroczy wartość 40
 */

example("Zadanie - rozwiązanie") { _ in

    let poziomWZbiorniku1 = PublishSubject<Int>()
    let poziomWZbiorniku2 = PublishSubject<Int>()
    let poziomWZbiorniku3 = PublishSubject<Int>()
    
    // Rozwiązanie umieść tutaj vvv
    
    
    
    
    
    
    
    
    
    
    
    // ----------------
    
    poziomWZbiorniku1.onNext(10)
    poziomWZbiorniku2.onNext(40)
    poziomWZbiorniku3.onNext(30)
    
    poziomWZbiorniku1.onNext(20)
    poziomWZbiorniku2.onNext(60)
    poziomWZbiorniku3.onNext(10)
    
    poziomWZbiorniku1.onNext(85)
    poziomWZbiorniku2.onNext(30)
    poziomWZbiorniku3.onNext(20)
}

//: [Dalej](@next)
