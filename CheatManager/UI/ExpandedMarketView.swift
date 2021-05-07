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
                            ExpandedMarketRowView(storeCheat: self.allCheats[i], rank: (i + 1))
                        }
                        Divider().padding(.horizontal)
                    }
                }
            }.navigationBarTitle(self.title, displayMode: .inline)
        }
    }
}
