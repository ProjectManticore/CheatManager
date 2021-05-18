//
//  StoreCheat.swift
//  CheatManager
//
//  Created by Luca on 19.04.21.
//

import Foundation

struct StandardCheatResponse: Codable {
    let status: String
    let data: [StoreCheat]
}

struct StandarAuthResponse: Codable {
    let status: String
    let data: [String: String]
}

struct StoreCheat: Codable, Identifiable, Equatable {
    static func == (lhs: StoreCheat, rhs: StoreCheat) -> Bool {
        return ((lhs.author == rhs.author) && (lhs.version == rhs.version) && (lhs.downvotes == rhs.downvotes) && (lhs.upvotes == rhs.upvotes) && (lhs.installations == rhs.installations) && (lhs.createdAt == rhs.createdAt) && (lhs.id == rhs.id) && (lhs.name == rhs.name) && (lhs.description == rhs.description))
    }
    
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
