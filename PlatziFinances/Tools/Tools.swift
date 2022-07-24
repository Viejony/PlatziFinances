//
//  Tools.swift
//  PlatziFinances
//
//  Created by Jhonyfer Angarita on 20/06/22.
//

import Foundation
import UIKit

class Tools{
    static let instance: Tools = Tools()
    
    private init(){}
    
    func setTopBar(_ viewController: UIViewController){
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = UIColor.init(named: "GreenColor")
            viewController.navigationController?.navigationBar.standardAppearance = navBarAppearance
            viewController.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    static func getTransString(_ key: String) -> String{
        return NSLocalizedString(key, comment: "")
    }
    
}


