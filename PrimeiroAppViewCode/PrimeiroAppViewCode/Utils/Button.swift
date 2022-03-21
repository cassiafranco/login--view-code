//
//  Button.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 18/03/22.
//

import UIKit

extension UIButton {
    
    func touchAnimation(action: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: { action.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)}, completion: { finish in UIButton.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            action.transform = .identity
            })
        })
    }
}
