//
//  StoreCheat.swift
//  CheatManager
//
//  Created by Luca on 19.04.21.
//

import Foundation

struct FeaturedCheatsResponse: Codable {
    let status: String
    let data: [StoreCheat]
}

struct StoreCheat: Codable, Identifiable {
    let version: Double
    let upvotes, downvotes, installations: Int
    let createdAt, id, name, author: String
    var description: String = ""
    var game: StoreGame

    enum CodingKeys: String, CodingKey {
        case version, upvotes, downvotes, installations
        case createdAt = "created_at"
        case id = "_id"
        case name, author
        case description = "description"
        case game
    }
}

struct StoreGame: Codable {
    let id: String
    let version: Double
    let name, bundleID: String
    var icon: String = "defaultAppicon"
    var banner: String = "defaultBanner"
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case version, name
        case bundleID = "bundle_id"
    }
}
