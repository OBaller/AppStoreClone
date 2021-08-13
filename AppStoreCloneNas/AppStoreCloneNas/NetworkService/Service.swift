//
//  Service.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 13/08/2021.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
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
    
}
