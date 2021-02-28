//
//  TabBarContollerViewController.swift
//  Bot-Shop
//
//  Created by Rafa Vazquez on 2/27/21.
//

import UIKit

class TabBarContoller: UITabBarController, UITabBarControllerDelegate {
    
    var firstItemImageView: UIImageView!
    var secondItemImageView: UIImageView!
    var thirdItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setupViewControllers()
        setupTabBarIcons()
    }
    
    func setupTabBarIcons(){

        let firstItemView = self.tabBar.subviews[0]
        let secondItemView = self.tabBar.subviews[1]
        let thirdItemView = self.tabBar.subviews[2]

        self.firstItemImageView = (firstItemView.subviews.first as! UIImageView)
        self.firstItemImageView.contentMode = .center

        self.secondItemImageView = (secondItemView.subviews.first as! UIImageView)
        self.secondItemImageView.contentMode = .center
        
        self.thirdItemImageView = (thirdItemView.subviews.first as! UIImageView)
        self.thirdItemImageView.contentMode = .center
    }
    
    func setupViewControllers(){

        let newBoxVC = NewOrderViewController()
        let navController1 = UINavigationController(rootViewController:newBoxVC)
        newBoxVC.tabBarItem = UITabBarItem(title: "New", image: UIImage(named: "tab-box"), tag: 0)

        let pastBoxesVC = PastOrderViewController()
        let navController2 = UINavigationController(rootViewController:pastBoxesVC)
        pastBoxesVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "tab-history"), tag: 1)
        
        let profileVC = ProfileViewController()
        let navController3 = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "tab-profile"), tag: 3)

        viewControllers = [navController1, navController2, navController3]
    }

    
}
