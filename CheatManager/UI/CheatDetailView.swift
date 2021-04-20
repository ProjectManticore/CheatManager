//
//  CheatDetailView.swift
//  CheatManager
//
//  Created by Luca on 20.04.21.
//

import SwiftUI

struct CheatDetailView: View {
    let storeCheat: StoreCheat
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(storeCheat.gameName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}
