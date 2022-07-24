//
//  OnBoardingViewController.swift
//  PlatziFinances
//
//  Created by Jhonyfer Angarita on 19/06/22.
//

import UIKit

struct OnBoardingItem{
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
    
    var pageControl: UIPageControl?
    
    // MARK: - Properties
    
    fileprivate(set) lazy var itemsContents: [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: Tools.getTransString("onboardingMsg0"),
                description: Tools.getTransString("onboardingPressStart"),
                imageName: "GreenPig"),
            OnBoardingItem(
                title: Tools.getTransString("onboardingMsg1"),
                description: Tools.getTransString("onboardingPressStart"),
                imageName: "OnBoarding1"),
            OnBoardingItem(
                title: Tools.getTransString("onboardingMsg2"),
                description: Tools.getTransString("onboardingPressStart"),
                imageName: "OnBoarding2"),
        ]
    }()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items = [UIViewController]()
        for i in 0..<self.itemsContents.count{
            items.append(self.instanceViewController(i))
        }
        return items
    }()

    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        
        pageControl?.numberOfPages = itemsContents.count
        updateContainerView(stepNumber: 0)
    }
    
    private func updateContainerView(stepNumber index: Int){
        setViewControllers(
            [contentViewController[index]],
            direction: .forward,
            animated: true)
    }
    
    private func instanceViewController(_ index: Int) -> UIViewController{
        guard let viewController = UIStoryboard(
            name: "OnBoarding",
            bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else
        {
            return UIViewController()
        }
        
        viewController.item = itemsContents[index]
        return viewController
    }

}

// MARK: - Extensions

extension OnBoardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        
        guard let index = contentViewController.firstIndex(of: viewController) else{
            return nil
        }
        let previousIndex = index - 1
        guard previousIndex >= 0 && contentViewController.count > previousIndex else {
            return nil
        }
        return contentViewController[previousIndex]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let index = contentViewController.firstIndex(of: viewController) else{
            return nil
        }
        let nextIndex = index + 1
        guard nextIndex < contentViewController.count && contentViewController.count > nextIndex else {
            return nil
        }
        return contentViewController[nextIndex]
    }
}

extension OnBoardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool)
    {
        guard let index = contentViewController.firstIndex(of: viewControllers!.first!) else{
            return
        }
        pageControl?.currentPage = index
    }
    
}
