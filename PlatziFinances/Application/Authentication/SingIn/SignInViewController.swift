//
//  SignInViewController.swift
//  PlatziFinances
//
//  Created by Jhonyfer Angarita on 24/07/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI(){
        
        // Setting header image using language
        guard let langString = Locale.current.languageCode else{
            headerImage.image = UIImage(named: "LaunchScreen_en")
            return
        }
        
        if langString == "es"{
            headerImage.image = UIImage(named: "LaunchScreen_es")
        }
        else{
            headerImage.image = UIImage(named: "LaunchScreen_en")
        }
    }
}
