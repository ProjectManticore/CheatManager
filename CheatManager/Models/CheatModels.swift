//
//  StoreCheat.swift
//  CheatManager
//
//  Created by Luca on 19.04.21.
//

import Foundation
//
//class FeaturedCheatsResponse: Codable {
//    let status: String
//    let data: [StoreCheat]
//}
//
//struct StoreGame: Codable, Identifiable {
//    var id: String = "1337"
//    var name: String
//    var bundle_id: String
//    var icon: String = "Sus"
//    var banner: String = "bab"
//    var version: Float = 0.1
//}
//
//struct StoreCheat: Codable, Identifiable {
//    var id: String = "1337"
//    var name: String
//    var version: Double = 0.1
//    var upvotes: Int = 0
//    var downvotes: Int = 0
//    var installations: Int = 0
//    var author: String
//    var description: String = "Awesome Game Cheat!"
//    var game: StoreGame
//    var createdAt: String = "w"
//}

struct FeaturedCheatsResponse: Codable {
    let status: String
    let data: [StoreCheat]
}

struct StoreCheat: Codable, Identifiable {
    let version: Double
    let upvotes, downvotes, installations: Int
    let createdAt, id, name, author: String
    let v: Int
    var game: StoreGame

    enum CodingKeys: String, CodingKey {
        case version, upvotes, downvotes, installations
        case createdAt = "created_at"
        case id = "_id"
        case name, author
        case v = "__v"
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
