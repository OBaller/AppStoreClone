//
//  AppGroupModel.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 16/08/2021.
//

import Foundation

struct AppGroupModel: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
  let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
