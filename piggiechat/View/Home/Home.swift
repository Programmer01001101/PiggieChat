//
//  Home.swift
//  piggiechat
//
//  Created by Microapples on 8/26/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @Binding var showChatPage:Bool
    let uid = UserDefaults.standard.value(forKey: "OtherUID") as! String
    let name = UserDefaults.standard.value(forKey: "OtherName") as! String
    let pic = UserDefaults.standard.value(forKey: "OtherPic") as! String
    var body: some View {
        ZStack{
                Color.yellow
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
            NavigationLink(destination: ChatView(chat: $showChatPage, name: name, pic: pic, uid: uid), isActive: self.$showChatPage) {
                Text("")
            }
            VStack{
                Text("Menu")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom,20)
                
                HStack{
                    Spacer()
                    moduleButton(showChatPage: $showChatPage,text: "Chattie",image: "chat")
                    Spacer()
                }
                Spacer()
            
            }
        }.navigationBarItems(leading: Button(action: {
            try! Auth.auth().signOut()
            UserDefaults.standard.set(false,forKey: "LoginStatus")
            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            
        }, label: {
            
            Image(systemName: "arrow.left").resizable().frame(width: 20, height: 15)
            
        }))
    }
}

struct moduleButton: View {
    @Binding var showChatPage:Bool
    var text:String
    var image:String
    
    var body: some View {
        
        Button(action: {
            self.showChatPage.toggle()
        }) {
            moduleButtonContent(text: text, image: image)
        }
        
    }
    
}

struct moduleButtonContent: View {
    var text:String
    var image:String
    var body: some View {
        VStack{
                CuteImage(image: image)
                LabelText(text: text)
        }.padding(5).frame(height: 340, alignment: .center)
    }
}

struct Home_Previews: PreviewProvider {
    @State static var showChatPage = false
    static var previews: some View {
        Home(showChatPage: $showChatPage)
    }
}
