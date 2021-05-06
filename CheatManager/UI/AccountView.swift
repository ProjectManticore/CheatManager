//
//  AccountView.swift
//  CheatManager
//
//  Created by Hallie on 5/4/21.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        CMHostView("Account", showsAccountImage: false) {
            Divider().padding(.horizontal)
            
            Text("This is my account")
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

