//
//  AccountDetailView.swift
//  CheatManager
//
//  Created by Luca on 06.05.21.
//

import SwiftUI

struct AccountDetailView: View {
    
    @State var showSignoutConfirmation: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Divider().padding(.horizontal)
                    HStack {
                        ZStack(alignment: .bottom) {
                            Image("ProfileImage")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 0)
                                    .frame(width: 100, height: 20)
                                    .foregroundColor(.black)
                                Button(action: {
                                    print("change picture")
                                }) {
                                    Text("EDIT")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .clipShape(Circle())
                        .padding(.leading, 20)
                        VStack(alignment: .leading) {
                            Text("halliehax")
                                .font(.title)
                                .bold()
                            Text("Created on 5/6/21")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
        
                    Divider().padding(.horizontal)
                    HStack {
                        Text("Email:")
                            .font(.headline)
                        Text("user@mail.com")
                        Spacer()
                        Button("Change") {
                            print("change email")
                        }
                    }.padding()
                    
                    Spacer()
                }
                Divider().padding(.horizontal)
                HStack {
                    Button(action: {
                        showSignoutConfirmation = true
                    }) {
                        Text("Sign out")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding(.horizontal).padding(.horizontal)
                    }
                    Spacer()
                }

                Divider().padding(.horizontal)
            }.navigationTitle("Account")
            .alert(isPresented: self.$showSignoutConfirmation) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("Signing out will do something"),
                    primaryButton: .destructive(Text("Yes")) {
                        print("Implement sign out")
                    },
                    secondaryButton: .default(Text("No"))
                )
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView()
    }
}
