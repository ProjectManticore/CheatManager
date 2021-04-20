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
    
    var body: some View {
        ZStack {
            HStack {
                Image(storeCheat.gameIcon)
                    .resizable()
                    .cornerRadius(10)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(storeCheat.gameName)
                        .fontWeight(.medium)
                    Text(storeCheat.author)
                        .foregroundColor(.gray).opacity(0.8)
                }
                Spacer()
                Button(action: {
                     print("sign up bin tapped")
                 }) {
                     Text("GET")
                }.buttonStyle(CellButtonStyle(sizeCategory: _sizeCategory))
            }.frame(width: 340, height: 70)
        }
    }
}
