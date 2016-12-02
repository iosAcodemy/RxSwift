//: [Wstecz](@previous)
/*:
 ## Replay
 ensure that all observers see the same sequence of emitted items, even if they subscribe after the Observable has begun emitting items
 [docs & marbles](http://reactivex.io/documentation/operators/replay.html)
*/

import Foundation
import RxSwift

example("Przykład - shareReplay") { _ in
    
    let observable = getUserName(userId: 1).shareReplay(1)
    
    observable
        .map { $0.characters.count }
        .debug("subskrypcja 1")
        .subscribe()

    observable
        .debug("subskrypcja 2")
        .subscribe(onNext: { (userName) in
            userName == "John"
                ? print("It's Johnny!")
                : print("It's not Johnny...")
        })
}

//: [Dalej](@next)
 