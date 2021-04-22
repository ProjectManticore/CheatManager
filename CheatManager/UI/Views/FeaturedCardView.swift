//
//  FeaturedCard.swift
//  CheatManager
//
//  Created by macuser2 on 18.04.21.
//

import SwiftUI

struct FeaturedCardView: View {
    @Binding var image: UIImage
    var storeCheat: StoreCheat
    @State var hovering: Bool = false
    @State private var showDetails: Bool = false

    var body: some View {
        ZStack {
            Color.gray
            Image(systemName: "shippingbox")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Image(uiImage: image).resizable()
                .frame(width: 300, height: 200)
                .scaledToFit()
            LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
            HStack(alignment: .top) {
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(storeCheat.game.name)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.secondary)
                        Text(storeCheat.game.name)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding()
                }
            }
        }
        .cornerRadius(15)
        .shadow(radius: 5)
        .gesture(LongPressGesture().onChanged { _ in self.showDetails = true })
        .sheet(isPresented: self.$showDetails, onDismiss: {
            self.showDetails = false
        }) {
            CheatDetailView(storeCheat: storeCheat)
        }
    }
}
