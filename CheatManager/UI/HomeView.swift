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
    @State var featuredCheats: [StoreCheat] = []
    
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
        )
    ]
	
    var body: some View {
        NavigationView {
            List {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
							ForEach(featuredCheats) { featuredCheat in
                                FeaturedCardView(image: self.$image, storeCheat: featuredCheat)
									.frame(width: 300, height: 200)
									.padding()
							}
                        }
                    }
                    Spacer()
                }.onAppear {
                    CMAPI().getFeaturedCheats { (featuredCheats) in
                        self.featuredCheats = featuredCheats.data
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Arcade Games")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    HStack() {
                            ForEach(arcadeCheats) { cheat in
                                MarketRowView(storeCheat: cheat)
                                    .padding(.leading)
                            }
                        }
                }.padding(.leading, 5)
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
