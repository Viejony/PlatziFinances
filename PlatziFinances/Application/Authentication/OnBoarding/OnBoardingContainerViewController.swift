//
//  OnBoardingContainerViewController.swift
//  PlatziFinances
//
//  Created by Jhonyfer Angarita on 19/06/22.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else{
            return
        }
        
        destination.pageControl = pageControl
    }
    

}
