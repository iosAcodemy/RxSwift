//
//  ProgressHUD.swift
//  RxSwiftAcodemy
//
//  Created by Cezary Kopacz on 09.11.2016.
//  Copyright © 2016 10Clouds. All rights reserved.
//

import Foundation
import JGProgressHUD
import RxSwift
import RxCocoa

class ProgressHUD: JGProgressHUD {
    
    var rx_isVisible: AnyObserver<Bool> {
        return UIBindingObserver(UIElement: self) { [weak self] hud, visible in
            guard let strongSelf = self else { return }
            if visible {
                hud.show(in: strongSelf.view)
            } else {
                hud.dismiss()
            }
        }.asObserver()
    }
    
    fileprivate let view: UIView
    
    init(view: UIView, style: JGProgressHUDStyle = .light) {
        self.view = view
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showText(_ text: String, dismissAfter delay: Double) {
        textLabel.text = text
        show(in: view)
        dismiss(afterDelay: delay)
    }
}
