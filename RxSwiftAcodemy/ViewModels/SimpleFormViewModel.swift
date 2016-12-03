//
//  BasicViewModel.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 09.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import RxSwift

enum Gender: Int {
    case male, female
}

extension Gender: CustomStringConvertible {
    var description: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        }
    }
}

struct SimpleFormViewModel {

    // MARK :- Properties
    
    let firstName = Variable<String?>(nil)
    let lastName = Variable<String?>(nil)
    let fullName = Variable<String?>("John Doe")
    
    let genderIndex = Variable<Int>(0)
    let formattedGender = Variable<String>("Male")
    
    let birthDate = Variable<Date>(Date())
    let formattedBirthDate = Variable<String>("")

    fileprivate let gender = Variable<Gender>(.male)
    fileprivate let disposeBag = DisposeBag()

    private static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.medium
        return df
    }()

    // MARK :- Initialization

    init() {
        setupObservables()
    }
    
    func setupObservables() {
        
        // TASK 2 
        // Create an observables to properly assign gender description to formattedGender 
        
        Observable.combineLatest(firstName.asObservable().filterNil(),
                                 lastName.asObservable().filterNil()) { "\($0.0) \($0.1)"}
            .skip(1)
            .bindTo(fullName)
            .addDisposableTo(disposeBag)
        
        birthDate
            .asObservable()
            .map(SimpleFormViewModel.dateFormatter.string)
            .bindTo(formattedBirthDate)
            .addDisposableTo(disposeBag)
    }
}
