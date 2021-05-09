//
//  AccountDetailView.swift
//  CheatManager
//
//  Created by Luca on 06.05.21.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
    let callback: (UIImage) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, callback)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        let callback: (UIImage) -> Void
        
        init(_ parent: ImagePicker, _ callback: @escaping (UIImage) -> Void) {
            self.parent = parent
            self.callback = callback
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
                callback(image)
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AccountDetailView: View {
    @State var showSignoutConfirmation: Bool = false
    @State var showProfilePicturePicker: Bool = false
    @State var profilePicture = UIImage(named: "ProfileImage")!
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Divider().padding(.horizontal)
                    HStack {
                        ZStack(alignment: .bottom) {
                            Image(uiImage: profilePicture)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 0)
                                    .frame(width: 100, height: 20)
                                    .foregroundColor(.black)
                                Button(action: {
                                    self.showProfilePicturePicker = true
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
        .sheet(isPresented: self.$showProfilePicturePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$profilePicture, callback: { selectedImage in
                print("[ACCOUNT] Chosen image size: \(selectedImage.size)")
                // Change image via CMAPI if image is valid/small
            })
        }
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView()
    }
}
