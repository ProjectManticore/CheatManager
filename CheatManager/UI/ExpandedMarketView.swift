//
//  ExpandedMarketView.swift
//  CheatManager
//
//  Created by Hallie on 5/6/21.
//

import SwiftUI
import UIKit

struct ExpandedMarketView: View {
    
    var title: String
    var allCheats: [StoreCheat]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    ForEach(0..<allCheats.count) { i in
                        HStack(alignment: .top) {
                            Text("\(i + 1)")
                                .font(.title)
                                .bold()
                                .padding()
                            MarketRowView(storeCheat: self.allCheats[i])
                        }
                        Divider().padding(.horizontal)
                    }
                }
            }.navigationBarTitle(self.title, displayMode: .inline)
        }
    }
}
