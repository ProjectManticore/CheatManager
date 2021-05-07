//
//  Search.swift
//  CheatManager
//
//  Created by Hallie on 5/6/21.
//

import SwiftUI
import UIKit

struct SearchView: View {
    
    @State var searchInput: String = ""
    
    var body: some View {
        CMHostView("Search") {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(Color.primary.opacity(0.2))
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.trailing, 2)
                    TextField("Search", text: self.$searchInput)
                        .textFieldStyle(DefaultTextFieldStyle())
                }.padding(.horizontal, 6).padding(.vertical, 6)
            }.padding(.horizontal)
        }.onTapGesture {
            UIApplication.shared.endEditing()
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
