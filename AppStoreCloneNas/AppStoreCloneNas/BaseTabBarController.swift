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
            createNavController(viewController: UIViewController(), title: "Today", imageName: "square.and.arrow.down"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "square.and.pencil"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "tray")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
