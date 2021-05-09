//
//  MarketCarousel.swift
//  CheatManager
//
//  Created by Hallie on 5/3/21.
//

import SwiftUI

struct MarketCarousel: View {
    let title: String
    var cheats: [StoreCheat]
    
    var rowCount: Int {
        if cheats.count > 6 {
            return 3
        } else {
            return Int(cheats.count / 2) + (cheats.count % 2 == 1 ? 1 : 0)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading).padding(.top)
                Spacer()
                NavigationLink("See All", destination: ExpandedMarketView(title: self.title, allCheats: self.cheats))
                    .padding(.trailing)
            }
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(0..<rowCount, id: \.self) { i in
                        VStack {
                            MarketRowView(storeCheat: self.cheats[i * 2])
                            if (cheats.count >= i * 2 + 2) {
                                Divider().padding(.horizontal)
                                MarketRowView(storeCheat: self.cheats[i * 2 + 1])
                            } else {
                                Spacer()
                            }
                        }
                    }
                }.padding(.leading).padding(.bottom)
            }
        }
    }
}
