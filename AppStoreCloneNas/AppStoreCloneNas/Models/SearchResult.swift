//
//  SearchResult.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 13/08/2021.
//

import Foundation
struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
}
