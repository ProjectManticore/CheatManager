//
//  MarketRowView.swift
//  CheatManager
//
//  Created by macuser2 on 19.04.21.
//

import SwiftUI

struct MarketRowView: View {
    let storeCheat: StoreCheat
    
    var body: some View {
        HStack(alignment: .top) {
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
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(Color.blue)
                    .background(Color.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                )
            }
            
        }.frame(width: 340, height: 70)
    }
}
