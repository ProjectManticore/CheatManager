//
//  MarketRowView.swift
//  CheatManager
//
//  Created by macuser2 on 19.04.21.
//

import SwiftUI

struct ExpandedMarketRowView: View {
    let storeCheat: StoreCheat
    let rank: Int
    @Environment(\.sizeCategory) var sizeCategory
    @State private var showDetails: Bool = false

    var body: some View {
        ZStack {
            HStack {
                Image(storeCheat.game.icon)
                    .resizable()
                    .cornerRadius(10)
                    .scaledToFit()
                    .frame(height: 60)
                
                VStack(alignment: .leading) {
                    Text("\(rank)")
                        .fontWeight(.medium)
                        .padding(.top)
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text(storeCheat.game.name)
                        .fontWeight(.medium)
                    Text(storeCheat.author)
                        .foregroundColor(.gray).opacity(0.8)
                }
                Spacer()
                
                // "GET" Button
                Button(action: {
                    self.showDetails = true
                }) {
                     Text("GET")
                }
                .sheet(isPresented: self.$showDetails) { CheatDetailView(storeCheat: storeCheat) }
                .buttonStyle(CellButtonStyle(sizeCategory: _sizeCategory))
            }.frame(width: 340, height: 70)
        }
    }
}
