//: [Wstecz](@previous)
/*:
 ## Sample
 emit the most recent items emitted by an Observable within periodic time intervals
 [docs & marbles](http://reactivex.io/documentation/operators/sample.html)
*/

import Foundation
import RxSwift

//example("Przykład - sample") { _ in
//    
//    let sampler = PublishSubject<Void>()
//    let source =  PublishSubject<String>()
//
//    source.sample(sampler)
//        .debug("")
//        .subscribe()
//    
//    source.onNext("Foo")
//    sampler.onNext()
//    sampler.onNext()
//    source.onNext("Bar")
//    sampler.onNext()
//    sampler.onNext()
//}

/*:
 ## Zadanie 5:
 Zmodyfikuj rozwiązanie z zadania nr 4 tak, aby poziom zbiorników był próbkowany zgodnie z "tikami" samplera.
 */

example("Zadanie - rozwiązanie") { _ in
    
    let poziomWZbiorniku1 = PublishSubject<Int>()
    let poziomWZbiorniku2 = PublishSubject<Int>()
    let poziomWZbiorniku3 = PublishSubject<Int>()
    let sampler = PublishSubject<Void>()

    // Umieść rozwiązanie tutaj vvv
    
    
    
    
    
    
    
    

    // ----------------
    
    poziomWZbiorniku1.onNext(10) // 10
    poziomWZbiorniku2.onNext(40) // 50
    poziomWZbiorniku3.onNext(30) // 80
    
    sampler.onNext()
    
    poziomWZbiorniku1.onNext(20) // 90
    poziomWZbiorniku2.onNext(60) // 110
    poziomWZbiorniku3.onNext(10) // 90
    
    sampler.onNext()
    
    poziomWZbiorniku1.onNext(85) // 155
    poziomWZbiorniku2.onNext(30) // 125
    poziomWZbiorniku3.onNext(20) // 135
    
    sampler.onNext()
    
    poziomWZbiorniku1.onNext(85) // 135
    poziomWZbiorniku2.onNext(30) // 135
    poziomWZbiorniku3.onNext(20) // 135

    sampler.onNext()
}

//: [Dalej](@next)
