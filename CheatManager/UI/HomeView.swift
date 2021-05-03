//
//  HomeView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI
import UIKit

struct HomeView: View {
	@State var image: UIImage = UIImage(named: "defaultBanner")!
    
    // TODO: Handle this via JSON parsing from API without freezing the UI
    @State var featuredCheats: [StoreCheat] = [
        StoreCheat(
            version: 10.1,
            upvotes: 10,
            downvotes: 10,
            installations: 10,
            createdAt: "0",
            id: "28765",
            name: "Subway",
            author: "Rpwnage",
            v: 22,
            game: StoreGame(
                id: "76857698u",
                version: 1765,
                name: "8fzh",
                bundleID: "com.some.bundle"
            )
        )
    ]
    
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
            v: 22,
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
            v: 22,
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
            v: 22,
            game: StoreGame(
                id: "76857698u",
                version: 1765,
                name: "8fzh",
                bundleID: "com.some.bundle"
            )
        ),
    ]
	
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                Divider().padding(.horizontal)
                
                FeaturedCarousel(cheats: featuredCheats)//.onAppear {
//                    CMAPI().getFeaturedCheats { (featuredCheats) in
//                        self.featuredCheats = featuredCheats.data
//                    }
//                }
                
                Divider().padding(.horizontal)
                
                MarketCarousel(title: "Arcade Games", cheats: arcadeCheats)
                
                Divider().padding(.horizontal)
                
                MarketCarousel(title: "Classic Games", cheats: arcadeCheats)
                
                Divider().padding(.horizontal)
                
                MarketCarousel(title: "Adventure", cheats: arcadeCheats)
                
                Divider().padding(.horizontal)
                
            }
			.navigationTitle(Text("Market"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
