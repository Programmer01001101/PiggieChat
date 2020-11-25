//
//  Login.swift
//  piggiechat
//
//  Created by Microapples on 8/26/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

//
//  Signin.swift
//  DriveChat
//
//  Created by Microapples on 7/27/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI

struct Signin : View{
   @State var showPiggieSigninPage = false
   @State var showBallSigninPage = false
   
   
   var body: some View {
    ZStack{
            Color.yellow
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)
        VStack{
            Spacer()
           HStack{
            SigninButton(showSigninPage: $showPiggieSigninPage,text: "I am Piggie",image: "Logo",useremail: "mengtonghu@piggiechat.com")
               Spacer()
               SigninButton(showSigninPage: $showBallSigninPage,text: "I am Ball",image: "Logo2",useremail: "ruixiangqi@piggiechat.com")
               
            }.padding(10)
            Spacer()
        }
        
    }
    }
    
}




struct SigninButton: View {
    @Binding var showSigninPage:Bool
    var text:String
    var image:String
    var useremail:String

    
    var body: some View {
        NavigationLink(destination: VerifyCode(email: useremail, image: image), isActive: $showSigninPage) {
            Button(action: {
                self.showSigninPage.toggle()
            }) {
                SigninButtonContent(text: text, image: image)
            }
        }
    }
    
}

struct SigninButtonContent: View {
    var text:String
    var image:String
    var body: some View {
        VStack{
                CuteImage(image: image)
                LabelText(text: text)
        }.padding(5).frame(height: 340, alignment: .center)
    }
}


struct CuteImage: View {
    var image:String
    var body: some View {
        Image(image).renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .padding(20)
            .clipShape(Circle())
    }
}

struct LabelText: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.system(size: 30))
            .fontWeight(.light)
            .padding(.bottom,20)
    }
}

struct Signin_Previews: PreviewProvider {
    static var previews: some View {
        Signin()
    }
}
