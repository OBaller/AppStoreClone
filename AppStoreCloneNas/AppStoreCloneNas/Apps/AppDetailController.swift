//
//  AppDetailController.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 18/08/2021.
//

import UIKit

class AppDetailController: BaseListController {
    fileprivate var appResults = [Result]()
    var appId: String! {
        didSet {
            print("here is my app id", appId ?? "")
            Service.shared.fetchDetails(detailId: appId) { (result, error) in
                if let error = error {
                    print("Failed to fetch Apps:", error)
                    return
                }
                self.appResults = result
                result.forEach({print($0.description)})
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    }
}
