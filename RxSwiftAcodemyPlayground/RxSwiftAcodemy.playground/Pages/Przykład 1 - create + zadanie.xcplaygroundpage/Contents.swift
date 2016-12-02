//: [Wstecz](@previous)
/*:
 ## Przykład 1

 1) tworzenie observable za pomocą **Observable.create**
 2) subskrybowanie
 
*/

import Foundation
import RxSwift

let observable = Observable<String>.create { (observer) -> Disposable in
    
    observer.on(.next("Hello"))
    observer.on(.completed)
    
    return Disposables.create()
}

example("Przykład 1-1") { _ in
    observable.subscribe { (event) in
        switch event {
        case .next(let element):
            print(element)
        case .error(let error):
            print(error)
        case .completed:
            print("completed")
        }
    }
}

/*:
 W powyższym przykładzie observerem jest anonimowa funkcja, którą przekazaliśmy jako parametr metody 'subscribe'
 Możemy też zrobić tak:
*/

//let observer: (Event<String>) -> Void = { (event) in
//    switch event {
//    case .next(let element):
//        print(element)
//    case .error(let error):
//        print(error)
//    case .completed:
//        print("completed")
//    }
//}
//
//example("Przykład 1-2") { _ in
//    observable.subscribe(observer)
//}

/*:
 lub rozszerzyć własną klasę o warunki protokołu ObserverType:
*/

//final class StringObserver: ObserverType {
//    
//    typealias E = String
//    
//    func on(_ event: Event<String>) {
//        switch event {
//        case .next(let element):
//            print(element)
//        case .error(let error):
//            print("Error: \(error)")
//        case .completed:
//            print("Completed")
//        }
//    }
//}
//
//example("Przykład 1-3") { _ in
//    let observer = StringObserver()
//    observable.subscribe(observer)
//}

/*:
 # Zadanie 1

 1) Przy pomocy metody **.create** utwórz obiekt observable, który wygeneruje 5 syngałów z wartościami: 1, 2, 3, 4 i 5. 
 2) Zasubskrybuj utworzoną sekwencję, wydrukuj do konsoli wszystkie sygnały
*/

example("Zadanie 1 - rozwiązanie") { _ in

}
//
////: [Dalej](@next)
