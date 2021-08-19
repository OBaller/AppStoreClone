//
//  AppDetailController.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 18/08/2021.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    fileprivate var appResults = [Result]()
    let cellId = "cellId"
    
    var appId: String! {
        didSet {
           // print("here is my app id", appId ?? "")
            Service.shared.fetchDetails(detailId: appId) { (result, error) in
                if let error = error {
                    print("Failed to fetch Apps:", error)
                    return
                }
                self.appResults = result
               // result.forEach({print($0.description)})
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.frame.width, height: 300)
    }
}
