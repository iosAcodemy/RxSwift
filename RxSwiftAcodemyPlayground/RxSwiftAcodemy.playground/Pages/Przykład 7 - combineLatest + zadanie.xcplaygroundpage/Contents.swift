//: [Wstecz](@previous)
/*:
 ## CombineLatest
 when an item is emitted by either of two Observables, combine the latest item emitted by each Observable via a specified function and emit items based on the results of this function
 [docs & marbles](http://reactivex.io/documentation/operators/combinelatest.html)
*/

import Foundation
import RxSwift

//example("Przykład - combineLatest") { _ in
//    
//    let source1 = PublishSubject<Int>()
//    let source2 = PublishSubject<String>()
//    
//    let observable = Observable.combineLatest(
//        source1,
//        source2
//    ) { (element1, element2) -> String in
//        return "\(element1)\(element2)"
//    }
//    
//    observable.debug("")
//        .subscribe()
//    
//    source1.onNext(1)
//    source2.onNext("A")
//    source1.onNext(2)
//    source2.onNext("B")
//    source2.onNext("C")
}

/*:
 ## Zadanie 4:
 Posiadając trzy sekwencje wejściowe, reprezentujące odczyty poziomu wody w trzech zbiornikach, zbuduj rozwiązanie drukujące alert w przypadku kiedy łączony poziom w zbiornikach przekroczy wartość 100. Użyj combineLatest i filter.
*/

example("Zadanie - rozwiązanie") { _ in
    
    let poziomWZbiorniku1 = PublishSubject<Int>()
    let poziomWZbiorniku2 = PublishSubject<Int>()
    let poziomWZbiorniku3 = PublishSubject<Int>()
    
    // Umieść rozwiązanie tutaj vvv - przed wystąpieniem sygnałów wejściowych
    
    
    
    
    
    
    
    
    
    
    // ----------------
    
    poziomWZbiorniku1.onNext(10) // 10
    poziomWZbiorniku2.onNext(40) // 50
    poziomWZbiorniku3.onNext(30) // 80
    
    poziomWZbiorniku1.onNext(20) // 90
    poziomWZbiorniku2.onNext(60) // 110
    poziomWZbiorniku3.onNext(10) // 90

    poziomWZbiorniku1.onNext(85) // 155
    poziomWZbiorniku2.onNext(30) // 125
    poziomWZbiorniku3.onNext(20) // 135
    
    poziomWZbiorniku1.onNext(85) // 135
    poziomWZbiorniku2.onNext(30) // 135
    poziomWZbiorniku3.onNext(20) // 135
}

//: [Dalej](@next)
