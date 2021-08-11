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
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        //redNavController.tabBarItem.image = UIImage(systemName: "Home")
        redNavController.navigationBar.prefersLargeTitles = true
        
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        //blueNavController.tabBarItem.image = #imageLiteral(resourceName: "magnifying-glass-computer-file-png-favpng-jHQnTzv92DVQiUPttsZ1G8VcK_t")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        
        viewControllers = [
            redNavController, blueNavController
        ]
    }
}
