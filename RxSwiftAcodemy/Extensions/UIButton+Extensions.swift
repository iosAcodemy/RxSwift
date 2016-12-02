//
//  UIButton+Extensions.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 04.09.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension UIButton {
    
    /*
     Additional bindable sink for validation result
    */
    var rx_validation: AnyObserver<Bool> {
        return UIBindingObserver(UIElement: self) { button, value in
                button.isEnabled = value
                button.alpha = value ? 1.0 : 0.5
            }.asObserver()
    }
}
