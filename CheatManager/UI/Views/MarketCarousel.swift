//
//  MarketCarousel.swift
//  CheatManager
//
//  Created by Hallie on 5/3/21.
//

import SwiftUI

struct MarketCarousel: View {
    let title: String
    let cheats: [StoreCheat]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading).padding(.top)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(cheats) { cheat in
                        VStack {
                            MarketRowView(storeCheat: cheat)
                            Divider().padding(.horizontal)
                            MarketRowView(storeCheat: cheat)
                        }
                    }
                }.padding(.leading).padding(.bottom)
            }
        }
    }
}
