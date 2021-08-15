//
//  Service.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 13/08/2021.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("failed to fetch apps", error)
                completion([], nil)
            }
           
            guard let data = data else {return}
            
            do {
                let jsonDecoder = try
                    JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(jsonDecoder.results, nil)
                
            } catch let jsonErr {
                print("failed to decode json data", jsonErr)
                completion([], nil)
            }
            
        }.resume()
        
    }
    
    func fetchGames(completion: @escaping (AppGroupModel?, Error?) -> ()) {
       guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else {return}
        // fetch data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                //print("Failed to fetch games", error)
                completion(nil, error)
            }
            guard let data = data else {return}
            
            do {
                let gameDecoder = try
                    JSONDecoder().decode(AppGroupModel.self, from: data)
                //gameDecoder.feed.results.forEach({print($0.name)})
                completion(gameDecoder, nil)
                
            } catch let jsErr {
                completion(nil, jsErr)
               // print("Failed to decode data", jsErr)
            }
        }.resume()
        
    }
}
