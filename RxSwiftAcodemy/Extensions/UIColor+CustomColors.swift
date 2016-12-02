//
//  UIColor+CustomColors.swift
//  RxSwiftAcodemy
//
//  Created by Krzysztof Bogacz on 18.11.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIColor {
    class func tenCloudsGreen(alpha: CGFloat = 1.0) -> UIColor {
        return  UIColor(red: 27/255.0, green: 254/255.0, blue: 192/255.0, alpha: alpha)
    }
    
    class func tenCloudsViolet(alpha: CGFloat = 1.0) -> UIColor {
        return  UIColor(red: 94/255.0, green: 31/255.0, blue: 228/255.0, alpha: alpha)
    }
}
