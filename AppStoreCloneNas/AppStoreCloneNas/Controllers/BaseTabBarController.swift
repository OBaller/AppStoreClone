//
//  BaseTabBarController.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 11/08/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "todays"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
