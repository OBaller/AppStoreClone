//
//  AppSearchController.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 11/08/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let cellId = "id1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesApps()
    }
    
    fileprivate func fetchItunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("failed to fetch apps", error)
            }
            
            // success
            //            print(data)
            //            print(String(data: data!, encoding: .utf8))
            guard let data = data else {return}
            
            do {
                let jsonDecoder = try
                    JSONDecoder().decode(SearchResult.self, from: data)
                jsonDecoder.results.forEach({print($0.trackName, $0.primaryGenreName)})
            } catch let jsonErr {
                print("failed to decode json data", jsonErr)
            }
            
        }.resume()
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "O'Balling"
        return  cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
