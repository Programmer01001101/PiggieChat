//
//  ContentView.swift
//  piggiechat
//
//  Created by Microapples on 8/26/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import Firebase
import FirebaseFirestore

let pink = Color(red: 214.0/255.0, green: 88.0/255.0, blue: 214.0/255.0)
let grey = Color(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0)
let blue = Color(red: 61.0/255.0, green: 118.0/255.0, blue: 224.0/255.0)
let yellow = Color(red: 255.0/255.0, green: 255.0/255.0, blue: 153.0/255.0)
let lightpink = Color(red: 255.0/255.0, green: 204.0/255.0, blue: 255.0/255.0)
let screenWidth:CGFloat = UIScreen.main.bounds.size.width-50
let buttonheight:CGFloat = 50


struct ContentView: View {
    @State var LoginStatus = UserDefaults.standard.value(forKey: "LoginStatus") as? Bool ?? false
    @State var showChatPage:Bool = false
    
    var body: some View {
        VStack{
            if LoginStatus{
                NavigationView{
                    Home(showChatPage: $showChatPage).environmentObject(MainObservable())}
           
            }
            else{
                NavigationView{
                    Signin()
                }
            }
        }.animation(.spring())
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) {
                    (_) in
                    let status = UserDefaults.standard.value(forKey: "LoginStatus") as? Bool ?? false
                    self.LoginStatus = status
                }
        }
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
