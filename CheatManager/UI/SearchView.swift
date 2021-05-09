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
            CMTextField("Search", withSystemImage: "magnifyingglass", for: self.$searchInput)
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
