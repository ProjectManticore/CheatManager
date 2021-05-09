//
//  GoogleSigninView.swift
//  CheatManager
//
//  Created by Luca on 09.05.21.
//

import SwiftUI
import GoogleSignIn

// Button
struct GoogleSignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        return GIDSignInButton()
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
    }
}

// Sign-In flow UI of the provider
struct SocialLogin: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
    }

    func attemptLoginGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func signOutGoogleAccount() {
        GIDSignIn.sharedInstance().signOut()
    }
}
