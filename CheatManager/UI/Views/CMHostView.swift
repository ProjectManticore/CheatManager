//
//  CMHostView.swift
//  CheatManager
//
//  Created by Hallie on 5/4/21.
//

import SwiftUI

struct CMHostView<Content : View> : View {
    var content : Content
    let title: String
    var showsAccountImage: Bool
    @State private var showAccountOverlay: Bool = false
    
    init(_ title: String, showsAccountImage: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
        self.showsAccountImage = showsAccountImage
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                content
            }
            .navigationBarTitle(self.title)
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    self.showAccountOverlay.toggle()
                }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                        .padding(.top, -8)
                }
            })
        }.navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: self.$showAccountOverlay) {
            AccountDetailView()
        }
    }
    
}
