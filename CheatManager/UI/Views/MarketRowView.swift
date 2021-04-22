//
//  MarketRowView.swift
//  CheatManager
//
//  Created by macuser2 on 19.04.21.
//

import SwiftUI

struct CellButtonStyle: ButtonStyle{
    @Environment(\.sizeCategory) var sizeCategory
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(sizeCategory >= ContentSizeCategory.extraExtraExtraLarge ? Font.system(size: 25).bold() : Font.body.bold())
            .foregroundColor(Color(.systemBlue))
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .textCase(.uppercase)
            .frame(minWidth: 70)
            .background(Capsule().fill(Color(.tertiarySystemGroupedBackground)))
            .opacity(configuration.isPressed ? 0.3: 1)
    }
    
}

struct MarketRowView: View {
    let storeCheat: StoreCheat
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
