//: [Wstecz](@previous)

import RxSwift
import RxCocoa

/*:
 # Subject
 jest rodzajem obiektu, który zachowuje się jednocześnie jak Observer i Observable. Ma możliwość nasłuchiwania jednej lub więcej sekwencji, oraz re-emitowania otrzymanych zdarzeń albo emitowania nowych.
 [docs & marbles](http://reactivex.io/documentation/subject.html)
 
 
 ## PublishSubject
 jest sekwencją rodzaju hot. Może nasłuchiwać jednej lub więcej sekwencji (hot lub cold), a następnie re-emitować otrzymane zdarzenia.
 PublishSubject sam z siebie nie emituje zdarzenia Completed, zrobi to dopiero, kiedy otrzyma je od jednego ze źródeł.
 
 */

//example("PublishSubject") { _ in
//    
//    let publisher = PublishSubject<Int>()
//    publisher.debug("")
//        .subscribe()
//    
//    let source1 = PublishSubject<Int>()
//    let source2 = PublishSubject<Int>()
//    
//    source1.bindTo(publisher)
//    source2.bindTo(publisher)
//    
//    source2.onNext(101)
//    source1.onNext(1)
//    source2.onNext(102)
//    source1.onNext(2)
//    source1.onNext(3)
//    source1.onCompleted()
//    source2.onNext(103)
//}

/*:
 ## BehaviorSubject
 jest podobny w zachowaniu do PublishSubject. Różnicą jest emitowanie ostatniej (lub początkowej) wartości nowym observerom
 */

//example("BehaviorSubject") {
//    let subject = BehaviorSubject(value: 0)
//    
//    subject.debug("")
//        .subscribe()
//    
//    let source1 = PublishSubject<Int>()
//    let source2 = PublishSubject<Int>()
//    
//    source1.bindTo(subject)
//    source2.bindTo(subject)
//    
//    source2.onNext(101)
//    source2.onNext(102)
//    
//    source1.onNext(1)
//    source1.onNext(2)
//
//    subject.subscribe(onNext: { (value) in
//        print("Ostatnia wartość: \(value)")
//    })
//}

/*:
 ## Variable
 opakowuje BehaviorSubject (emituje ostatnią lub początkową wartość każdej nowej subskrypcji). Dodatkowo przechowuje aktualny stan (wartość). Nigdy nie wyemituje zdarzenia Error. Emituje Completed przy dealokacji.
 */

//example("Variable") {
//    let variable = Variable("🔴")
//    
//    variable.asObservable()
//        .debug("")
//        .subscribe()
//    
//    variable.value = "🐶"
//    variable.value = "🐱"
//
//    let source1 = PublishSubject<String>()
//    
//    source1.bindTo(variable)
//
//    source1.onNext("🅰️")
//    source1.onCompleted()
//    source1.onNext("🅱️")
//    
//    print("Bezpośredni dostęp do aktualnego stanu: \(variable.value)")
//}

//: [Dalej](@next)
