//
//  NetworkModels.swift
//  CheatManager
//
//  Created by Luca on 22.04.21.
//

import Foundation

/*
 *  StoreNetworkError
 *     Error Types:
 *          -> errorCode: 1, localizedDescription: "unable to reach host"
 *
 */

struct StoreNetworkError: Codable {
    let errorCode: Int
    let localizedDescription: String
}
