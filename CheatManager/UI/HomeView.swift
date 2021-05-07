//
//  HomeView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI
import UIKit
import CoreData

struct HomeView: View {
	@State var image: UIImage = UIImage(named: "defaultBanner")!
    @FetchRequest(entity: Cheat.entity(), sortDescriptors: []) var cheats: FetchedResults<Cheat>
    @Environment(\.managedObjectContext) var managedObjectContext
    let dProvider = DataManager()
    @State var featuredCheats: [StoreCheat] =  []
    
    let arcadeCheats: [StoreCheat] = [
        StoreCheat(
            version: 10.1,
            upvotes: 10,
            downvotes: 10,
            installations: 10,
            createdAt: "0",
            id: "28765",
            name: "Subway",
            author: "Rpwnage",
            game: StoreGame(
                id: "76857698u",
                version: 1765,
                name: "8fzh",
                bundleID: "com.some.bundle"
            )
        ),
        StoreCheat(
            version: 10.1,
            upvotes: 10,
            downvotes: 10,
            installations: 10,
            createdAt: "0",
            id: "28765",
            name: "Subway",
            author: "Rpwnage",
            game: StoreGame(
                id: "76857698u",
                version: 1765,
                name: "8fzh",
                bundleID: "com.some.bundle"
            )
        ),
        StoreCheat(
            version: 10.1,
            upvotes: 10,
            downvotes: 10,
            installations: 10,
            createdAt: "0",
            id: "28765",
            name: "Subway",
            author: "Rpwnage",
            game: StoreGame(
                id: "76857698u",
                version: 1765,
                name: "8fzh",
                bundleID: "com.some.bundle"
            )
        ),
    ]
	let dataManager = DataManager()
        
    var body: some View {
        CMHostView("Market") {
            Divider().padding(.horizontal)
            FeaturedCarousel(cheats: featuredCheats).onAppear(perform: {
                self.dProvider.receiveFeaturedCheats(managedObjectContext: self.managedObjectContext, completion: { cheats in
                    self.featuredCheats = cheats
                })
            })
            Divider().padding(.horizontal)
            MarketCarousel(title: "Arcade Games", cheats: arcadeCheats)
            Divider().padding(.horizontal)
            MarketCarousel(title: "Classic Games", cheats: arcadeCheats)
            Divider().padding(.horizontal)
            MarketCarousel(title: "Adventure", cheats: arcadeCheats)
            Divider().padding(.horizontal)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
