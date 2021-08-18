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
    
    func fetchTopGrossing(completion: @escaping (AppGroupModel?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroupModel?, Error?) -> ()) {
        fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json", completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (AppGroupModel?, Error?) -> ()) {
        fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json", completion: completion)
    }
    
    // helper for multiple fetch
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroupModel?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else {return}
            
            do {
                let gameDecoder = try
                    JSONDecoder().decode(AppGroupModel.self, from: data)
                completion(gameDecoder, nil)
                
            } catch let jsErr {
                completion(nil, jsErr)
            }
        }.resume()
    }
    
    func FetchHeaderData(urlString: String, completion: @escaping ([HeaderModel]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else {return}
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("failed to fetch apps", error)
                completion(nil, error)
            }
           
            guard let data = data else {return}
            
            do {
                let jsonDecoder = try
                    JSONDecoder().decode([HeaderModel].self, from: data)
                
                completion(jsonDecoder, nil)
                
            } catch let jsonErr {
                print("failed to decode json data", jsonErr)
                completion(nil, jsonErr)
            }
            
        }.resume()
    }
}

