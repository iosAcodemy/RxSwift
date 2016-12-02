//
//  UIView+Extensions.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 25.08.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addSizeConstraints(_ size: CGSize) {
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil,
            attribute: .notAnAttribute, multiplier: 1, constant: size.width))
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil,
            attribute: .notAnAttribute, multiplier: 1, constant: size.height))
    }
    
    func addConstraintsToCenterOfView(_ superview: UIView) {
        superview.addConstraint(NSLayoutConstraint(item: self, attribute: .centerX,
            relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0))
        superview.addConstraint(NSLayoutConstraint(item: self, attribute: .centerY,
            relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    func addConstraintsToSuperview(_ superview: UIView, insets: UIEdgeInsets) {
        superview.addConstraint(NSLayoutConstraint(item: self, attribute: .top,
            relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: insets.top))
        superview.addConstraint(NSLayoutConstraint(item: self, attribute: .leading,
            relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: insets.left))
        superview.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom,
            relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: insets.bottom))
        superview.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing,
            relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: insets.right))
    }
}
