//
//  Shadow.swift
//  PlatziFinances
//
//  Created by Jhonyfer Angarita on 18/06/22.
//

import UIKit

extension UIView{
    var borderUIColor: UIColor{
        get {
            guard let color = layer.borderColor else{
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
