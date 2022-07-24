//
//  OnBoardingStepsViewController.swift
//  PlatziFinances
//
//  Created by Jhonyfer Angarita on 19/06/22.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onBoardingImage: UIImageView!
    
    var item: OnBoardingItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onBoardingImage.image = UIImage(named: item?.imageName ?? "")
        
    }
}
