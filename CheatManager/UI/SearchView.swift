//
//  Search.swift
//  CheatManager
//
//  Created by Hallie on 5/6/21.
//

import SwiftUI
import UIKit

struct SearchView: View {
    let cmAPI = CMAPI()
    @State var searchInput: String = ""
    @State var respCheats: [StoreCheat] = []
    
    var body: some View {
        CMHostView("Search") {
            CMTextField("Search", withSystemImage: "magnifyingglass", for: self.$searchInput)
                .padding(.bottom)
                .padding(.horizontal)
            if self.respCheats.count > 0 {
                ForEach(self.respCheats){ cheat in
                    MarketRowView(storeCheat: cheat)
                }
            }else {
                Button(action: {
                    print("TODO")
                }) {
                    VStack(alignment: .leading) {
                        Divider()
                        Text("Cheats for installed Games")
                            .padding(.horizontal)
                        Divider()
                    }.padding(.horizontal)
                }
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }.onChange(of: searchInput) { string in
            if string.count >= 3 {
                cmAPI.searchByAuthor(Author: self.searchInput) { resp in
                    self.respCheats = resp.data
                }
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
