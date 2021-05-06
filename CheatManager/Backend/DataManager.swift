//
//  DataManager.swift
//  CheatManager
//
//  Created by Luca on 06.05.21.
//

import Foundation
import CoreData
import Network
import SwiftUI

class DataManager {
    @Environment(\.managedObjectContext) private var managedObjectContext
    let networkManager = CMAPI()
    let netwrokMonitor = NWPathMonitor()
    var isNetworkConnected: Bool = true

    
    // We need to find a workaround for this
    private var featuredCheats: [StoreCheat] = []
    
    init() {
        self.netwrokMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isNetworkConnected = true
            } else { self.isNetworkConnected = false }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        self.netwrokMonitor.start(queue: queue)
    }
    
    func receiveFeaturedCheats() -> [StoreCheat] {
        if self.isNetworkConnected == true {
            // Fetch data from the API using the CMAPI
            print("Network connected")
            CMAPI().getFeaturedCheats { (featuredCheats) in self.featuredCheats = featuredCheats.data }
        } else if self.isNetworkConnected == false {
            // Fetch the data from CoreData
            print("No network connection")
        }
        
        return self.featuredCheats
    }
}
