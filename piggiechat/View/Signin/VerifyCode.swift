//
//  VerifyCode.swift
//  piggiechat
//
//  Created by Microapples on 8/26/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct VerifyCode: View {
    @State var msg = ""
    @State var alert = false
    @State var code = ""
    var email: String
    var image: String
    
    
    var body: some View {
        ZStack{
        Color.pink
            .opacity(0.4)
            .edgesIgnoringSafeArea(.all)
        VStack{
            CuteImage(image:image)
            VerifyCodeBigText()
            VerifyCodeSmallText()
            PasswordSecureField(password: $code)
            VerifyButton(email: email, password: $code, msg: $msg,alert: $alert)
            Spacer()

            
    
        }.padding(.horizontal,40)
        .alert(isPresented:$alert){
            
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
        }
            
    }
}

struct PasswordSecureField: View {
    @Binding var password:String

    var body: some View {
        VStack(alignment: .leading){
            Text("Code").offset(y:5)
            HStack{
                SecureField("code", text: $password)
                    .cornerRadius(5.0)
                    .font(.system(size: 25.0))
                    .frame(width:screenWidth,height: 40)
                Image("key")
                
            }
//            Divider()
            
        
        }.padding(.bottom,30)
    }
}

struct VerifyCodeBigText: View {
    var body: some View {
        Text("Passcode")
            .font(.system(size: 30))
            .fontWeight(.bold)
            .padding(.bottom,20)
    }
}

struct VerifyCodeSmallText: View {
    var body: some View {
        Text("Please Enter Your Unique Passcode")
            .font(.system(size: 12))
            .foregroundColor(grey)
            .padding()
    }
}








struct SigninContent: View {
    var body: some View {
        Text("Verify")
            .font(.headline)
            .foregroundColor(yellow)
            .frame(width:screenWidth,height: buttonheight)
            .cornerRadius(5)
        .border(yellow)
    }
}


struct VerifyButton: View {
    var email:String
    @Binding var password:String
    @Binding var msg : String
    @Binding var alert : Bool
    
    var body: some View {
        Button(action: {
            SignInWithEmail(email: self.email, password: self.password) { (verified, status) in
                if !verified{
                    self.msg = status
                    self.alert.toggle()
                }
                else{
                    UserDefaults.standard.set(true, forKey: "LoginStatus")
                    if self.email=="mengtonghu@piggiechat.com"{

                    UserDefaults.standard.set("Piggie", forKey: "UserName")
                    UserDefaults.standard.set("https://firebasestorage.googleapis.com/v0/b/piggiechat-5d9bc.appspot.com/o/icon.jpg?alt=media&token=71d1142f-2cee-4631-81db-a05f84935723", forKey: "pic")
                    UserDefaults.standard.set("PVDpHKVxBDYHS9KrHMwPX66kEgL2", forKey: "UID")
                        
                    UserDefaults.standard.set("Ball", forKey: "OtherName")
                    UserDefaults.standard.set("https://firebasestorage.googleapis.com/v0/b/piggiechat-5d9bc.appspot.com/o/icon2.jpg?alt=media&token=cb79bb47-b1a4-46d5-9d66-fc7bfc00f49f", forKey: "OtherPic")
                   UserDefaults.standard.set("2IjFoY2W84QjwxuZVh0TmoHFyTx1", forKey: "OtherUID")


                    }else{

                     UserDefaults.standard.set("Ball", forKey: "UserName")
                     UserDefaults.standard.set("https://firebasestorage.googleapis.com/v0/b/piggiechat-5d9bc.appspot.com/o/icon2.jpg?alt=media&token=cb79bb47-b1a4-46d5-9d66-fc7bfc00f49f", forKey: "pic")
                    UserDefaults.standard.set("2IjFoY2W84QjwxuZVh0TmoHFyTx1", forKey: "UID")
                        
                    
                    UserDefaults.standard.set("Piggie", forKey: "OtherName")
                    UserDefaults.standard.set("https://firebasestorage.googleapis.com/v0/b/piggiechat-5d9bc.appspot.com/o/icon.jpg?alt=media&token=71d1142f-2cee-4631-81db-a05f84935723", forKey: "OtherPic")
                    UserDefaults.standard.set("PVDpHKVxBDYHS9KrHMwPX66kEgL2", forKey: "OtherUID")
                        
    
  
                    }
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }
            }
          
        }) {
            SigninContent()
        }
    }
}


struct VerifyCode_Previews: PreviewProvider {
    @State static var email = "ruixiangqi@piggiechat.com"
    @State static var image = "icon"


    static var previews: some View {
        VerifyCode(email: email, image: image)
    }
}

