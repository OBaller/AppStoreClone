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
        
        let todayController = UIViewController()
        todayController.view.backgroundColor = .white
        todayController.navigationItem.title = "Today"
        
        let todayNavController = UINavigationController(rootViewController: todayController)
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = UIImage(systemName: "square.and.arrow.down")
        todayNavController.navigationBar.prefersLargeTitles = true
        
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = UIImage(systemName: "square.and.pencil")
        redNavController.navigationBar.prefersLargeTitles = true
        
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.tabBarItem.image = UIImage(systemName: "tray")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        
        viewControllers = [
           todayNavController, redNavController, blueNavController
        ]
    }
}
