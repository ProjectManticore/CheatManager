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
                    .fixedSize(horizontal: false, vertical: true) //Fixes truncating text when typing
                    .padding(.bottom)
                Group {
                    VerificationTextField("Username", for: self.$usernameInput) //Eventually add checks to see if the username is taken!
                    if (self.isSignUp) {
                        VerificationTextField("Email", for: self.$emailInput) //Add verification for is actually an email ~ too tired rn
                    }
                    VerificationTextField("Password", for: self.$passwordInput, isPrivate: true, withRules: !self.isSignUp ? nil : [ //Add rules for when they are signing up, and the password needs certain things
                        CMTextFieldRules(title: "Must be longer than 3 characters", isFulfilled: self.passwordInput.count > 3),
                        CMTextFieldRules(title: "Contain a number", isFulfilled: (self.passwordInput.rangeOfCharacter(from: CharacterSet(charactersIn: "1234567890")) != nil))
                    ])
                    if (self.isSignUp) {
                        VerificationTextField("Verify Password", for: self.$passwordVerificationInput, isPrivate: true, withRules: [
                            CMTextFieldRules(title: "Must match your password", isFulfilled: (self.passwordInput == self.passwordVerificationInput && (self.passwordInput != "")))
                        ])
                    }
                    Button(action: { //MARK : Start of Google Sign In
                        print("Handle sign in/up please")
                    }) {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.accentColor)
                                .frame(height: 45)
                                .padding(.vertical)
                            Text(self.isSignUp ? "Sign Up" : "Signin")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    
                    Button(action: {
                        self.isSignUp.toggle()
                    }) {
                        Text(isSignUp ? "Login instead" : "Sign up instead")
                    }
                }.padding(.bottom, 8)
                Spacer()
                Button(action: { //MARK : Start of Google Sign In
                    SocialLogin().attemptLoginGoogle()
                }) {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.accentColor)
                            .frame(height: 45)
                            .padding(.vertical)
                        HStack {
                            Image("googleIcon")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .shadow(color: Color.white, radius: 10.0, x: 0, y: 0)
                            Text(self.isSignUp ? "Sign Up with Google" : "Signin with Google")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }.padding(.horizontal)
        }.animation(Animation.default.speed(1))
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}


