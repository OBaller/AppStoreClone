//
//  AppsController.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 13/08/2021.
//

import UIKit

class AppsPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let celId = "id"
    let headerId = "headerId"
    let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    var headerModel = [HeaderModel]()
    var groups = [AppGroupModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: celId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        fetchData()
    }
    
    fileprivate func fetchData() {
        var group1: AppGroupModel?
        var group2: AppGroupModel?
        var group3: AppGroupModel?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, error) in
            dispatchGroup.leave()
            group1 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (appGroup, error) in
            dispatchGroup.leave()
            group2 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopFree { (appGroup, error) in
            dispatchGroup.leave()
            group3 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.FetchHeaderData(urlString: "") { (result, error) in
            //result?.forEach({print($0.name )})
            dispatchGroup.leave()
            self.headerModel = result ?? []
        }
        
        // completion
        dispatchGroup.notify(queue: .main) {
            print("Completed dispacth group task")
            self.activityIndicator.stopAnimating()
            self.groups = [group1, group2, group3].compactMap {$0}
            self.collectionView.reloadData()
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.headerModel = self.headerModel
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celId, for: indexPath) as! AppsGroupCell
        let appGroup = groups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self] feedResult in
                let detailController = AppDetailController()
            detailController.appId = feedResult.id
                detailController.view.backgroundColor = .white
            self?.navigationController?.pushViewController(detailController, animated: true)
            detailController.navigationItem.title = feedResult.name
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

//if let group = group1 {
//    self.groups.append(group)
//}
//if let group = group2 {
//    self.groups.append(group)
//}
//if let group = group3 {
//    self.groups.append(group)
//}
//}
