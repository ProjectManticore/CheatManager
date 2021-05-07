//
//  LoadingView.swift
//  CheatManager
//
//  Created by Luca on 07.05.21.
//

import SwiftUI
import CoreData

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(.accentColor)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.accentColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.title2)
                .bold()
        }
    }
}

struct LoadingView: View {
    @FetchRequest(entity: Cheat.entity(), sortDescriptors: []) var cheats: FetchedResults<Cheat>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var progressValue: Float = 0.0
    @State var progressTask: String = ""
    @State var installationStarted: Bool = false
    @State var dismissInstallSuccess: Bool = false
    var dProvider = DataManager()
    
    var body: some View {
        if installationStarted == true {
            VStack {
                Spacer()
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                    .onAppear(perform: {
                        checkForUpdates()
                        cacheFeaturedPage()
                    })
                Text(self.progressTask)
                    .bold()
                    .font(.title2)
                Spacer()
            }
        } else if installationStarted == false {
            VStack {
                HStack {
                    Text("Welcome!")
                        .bold()
                        .font(.system(size: 50))
                        .padding(.top, 40)
                        
                    Spacer()
                }.padding(.bottom, 10)
                Text("To fully use CheatManager you must have additional packages and frameworks installed. Because we care about the security of our users, we check the existence of all necessary components after each CheatManager core installation.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.leading, 20)
        }
        
        if progressValue == 1 {
            Button(action: {
                self.dismissInstallSuccess = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.accentColor)
                        .padding(.horizontal, 20)
                        .frame(height: 65)
                    
                    Text("Done")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .fullScreenCover(isPresented: self.$dismissInstallSuccess, content: MainTabView.init)
        }
        else if self.installationStarted == false {
            Button(action: {
                self.installationStarted = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.accentColor)
                        .padding(.horizontal, 20)
                        .frame(height: 65)
                    
                    Text("Install")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
        }
        else {
            Button(action: {
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.accentColor).opacity(0.6)
                        .padding(.horizontal, 20)
                        .frame(height: 65)
                    
                    Text("Done")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }.disabled(true)
            .buttonStyle(PlainButtonStyle())
        }
        
    }
    
    func checkForUpdates() {
        self.progressTask = "Checking for updates..."
        self.progressValue += 0.1
    }
    
    func cacheFeaturedPage() {
        self.progressTask = "Connecting to API..."
        self.dProvider.receiveFeaturedCheats(managedObjectContext: self.managedObjectContext) { featuredCheats in
            self.progressValue += 1 - self.progressValue
        }
    }
    
    func incrementProgress() {
        self.progressValue += 25
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .preferredColorScheme(.dark)
    }
}
