//
//  FeaturedCarousel.swift
//  CheatManager
//
//  Created by Hallie on 5/3/21.
//

import SwiftUI

struct FeaturedCarousel: View {
    let cheats: [StoreCheat]
    @State var image: UIImage = UIImage(named: "defaultBanner")!

    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.top).padding(.leading)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(cheats) { cheat in
                        VStack {
                            FeaturedCardView(image: self.$image, storeCheat: cheat)
                        }
                    }
                }.padding(.leading).padding(.bottom)
            }
        }
    }
}
