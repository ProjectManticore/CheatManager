//
//  StoreCheat.swift
//  CheatManager
//
//  Created by Luca on 19.04.21.
//

import Foundation

class FeaturedCheatsResponse: Codable {
    let status: String
    let data: [StoreCheat]

    init(status: String, data: [StoreCheat]) {
        self.status = status
        self.data = data
    }
}


struct StoreCheat: Codable, Identifiable {
	let id: String
	let author: String
	let version: String
    let description: String
	let gameIcon: String
	let gameBanner: String
	let gameName: String
	let gameBundleID: String
	let gameVersion: String
}
