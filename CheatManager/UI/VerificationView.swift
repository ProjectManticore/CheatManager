//
//  LoginView.swift
//  CheatManager
//
//  Created by Hallie on 5/8/21.
//

import SwiftUI
import UIKit

struct VerificationView: View { //Used as a blockade against any parts of CheatManager that require the user to be logged in. Can also be shown as part of the onboarding process
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var usernameInput: String = ""
    @State var passwordInput: String = ""
    @State var emailInput: String = ""
    @State var passwordVerificationInput: String = ""
    @State var showPassword: Bool = false
    @State var isSignUp: Bool = false //Use this var to toggle the state of the page. Should likely add an animation when toggling between the two views, but this provides the minimum control
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0) //Add a background so you can tap out of the text field
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(self.colorScheme == .dark ? .black : .white)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            VStack {
                Text("CheatManager ID")
                    .bold()
                    .font(.title)
                    .padding(.top, 80)
                    .padding()
                Text(isSignUp ? "Register now to unlock the full game-winning potential of Cheat Manager, a universal iOS game mod engine" : "Please sign in to use this feature of CheatManager and have full access to the potential!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                Group {
                    CMTextField("Username", for: self.$usernameInput, isSecureField: false)
                    if (self.isSignUp) {
                        CMTextField("Email", for: self.$emailInput, isSecureField: false)
                    }
                    HStack {
                        if showPassword == false {
                            CMTextField("Password", for: self.$passwordInput, withRules: !self.isSignUp ? nil : [ //Add rules for when they are signing up, and the password needs certain things
                                CMTextFieldRules(title: "Must be longer than 3 characters", isFulfilled: self.passwordInput.count > 3),
                                CMTextFieldRules(title: "Contain a number", isFulfilled: (self.passwordInput.rangeOfCharacter(from: CharacterSet(charactersIn: "1234567890")) != nil))
                            ], isSecureField: true)
                        } else {
                            CMTextField("Password", for: self.$passwordInput, withRules: !self.isSignUp ? nil : [ //Add rules for when they are signing up, and the password needs certain things
                                CMTextFieldRules(title: "Must be longer than 3 characters", isFulfilled: self.passwordInput.count > 3),
                                CMTextFieldRules(title: "Contain a number", isFulfilled: (self.passwordInput.rangeOfCharacter(from: CharacterSet(charactersIn:  "1234567890")) != nil))
                            ], isSecureField: false)
                        }
                        
                        let passwordToggle = Button(action: {
                            print("password toggled")
                            self.showPassword.toggle()
                        }) {
                            if self.showPassword == true {
                                Image(systemName: "eye.slash.fill")
                            } else {
                                Image(systemName: "eye.fill")
                            }
                        }
                        
                        if isSignUp == false  {
                            passwordToggle.padding(.all, 10).background(Color(UIColor.systemGray6)).cornerRadius(6)
                        } else if isSignUp == true && UIDevice.current.userInterfaceIdiom == .pad {
                            passwordToggle.padding(.all, 10).background(Color(UIColor.systemGray6)).cornerRadius(6).offset(y: -32)
                        } else {
                            passwordToggle.padding(.all, 10).background(Color(UIColor.systemGray6)).cornerRadius(6).offset(y: -25)
                        }
                    }
                    
                    if (self.isSignUp) {
                        if showPassword == false {
                            CMTextField("Verify Password", for: self.$passwordVerificationInput, isSecureField: true)
                        } else {
                            CMTextField("Verify Password", for: self.$passwordVerificationInput, isSecureField: false)
                        }
                    }
                    Button(action: {
                        print("Sign me in/register me please!")
                    }) {
                        Text(self.isSignUp ? "Sign Up" : "Sign In")
                    }
                }.padding(.bottom, 8)
                Spacer()
                Button(action: {
                    self.isSignUp.toggle()
                }) {
                    Text(isSignUp ? "Login instead" : "Sign up instead")
                }.padding()
            }.padding(.horizontal)
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}


