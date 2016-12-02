/*:

## Trzy podstawowe typy w RxSwift, które interesują nas na początku to

 1) Event
 2) ObservableType
 3) ObserverType

Są to typy generyczne z powiązanym typem E (Element), który informuje o typie elementów zawartych w zdarzeniach.

## Event
Event w praktyce jest enumem posiadającym trzy przypadki, opisujące rodzaje zdarzeń:

*/

     public enum Event<Element> {
     /// Kolejny element sekwencji.
     case Next(Element)
     
     /// Sekwencja zakończyła się błędem.
     case Error(ErrorType)
     
     /// Sekwencja zakończyła się bez błędu.
     case Completed
     }

/*:

## ObservableType
ObservableType jest typem, który możemy `obserwować' poprzez zasubskrybowanie go, tj. nasłuchiwać na generowane przez niego Eventy.
ObservableType musi posiadać associatedType E, który informuje o typie elementów sekwencji, oraz implementować metodę `subscribe`:
*/

    func subscribe<O: ObserverType where O.E == E>(observer: O) -> Disposable

/*:
## ObserverType
ObserverType jest typem, który potrafi 'obserwować', tj. potrafi obsłużyć Event danego typu.
ObserverType musi implementować metodę

*/
    func on(event: Event<E>)

/*:
i posiadać associatedType E

## Cold vs Hot Observable

Cold jest rodzajem sekwencji, która emituje zdarzenia dopiero po jej zasubskrybowaniu. Emituje (ponownie) osobny zestaw zdarzeń dla każdego observera.
Hot emituje zdarzenia niezależnie od tego, czy ktoś jej nasłuchuje. Observer, który zacznie nasłuchiwać takiej sekwencji nie otrzyma zdarzeń, które wystąpiły przed chwilą subskrypcji.
*/


//: [Dalej](@next)
