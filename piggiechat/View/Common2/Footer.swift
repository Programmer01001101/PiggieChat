//
//  Footer.swift
//  DriveChat
//
//  Created by Microapples on 8/4/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI


struct Footer: View {
    @Binding var showProfilePage:Bool
    @Binding var showMessagePage:Bool
    var body: some View {
        HStack{
            DiscoveryButton()
            MessageButton(showMessagePage: $showMessagePage, showProfilePage: $showProfilePage)
            
            LogoutButton()
            
            TripsButton()
            ProfileButton(showProfilePage: $showProfilePage, showMessagePage: $showMessagePage)
            
        }
            .padding(.top,10)
            .allowsTightening(true)
            .lineLimit(1)
    }
}


// MARK: - -  Discovery Starts Here
struct DiscoveryButton: View {
    var body: some View {
        VStack{
            Image(systemName: "globe").font(.system(size: 40))
            Text("Discovery").font(.system(size: 15)).fontWeight(.bold)
        }.padding(5)
    }
}

// MARK: - -  Message Starts Here
struct MessageButton: View {
    @Binding var showMessagePage:Bool
    @Binding var showProfilePage:Bool
    var body: some View {
        Button(action: {
            self.showProfilePage = false
            self.showMessagePage = true
        }){
            MessageButtonContent()
        }
    }
}

struct MessageButtonContent: View {
    
    var body: some View {
        VStack{
            Image(systemName: "message").font(.system(size: 40))
            Text("Message").font(.system(size: 15)).fontWeight(.bold)
        }.padding(5).foregroundColor(Color.black)
    }
}




// MARK: - -  Trip Starts Here

struct TripsButton: View {
    var body: some View {
        VStack{
            Image(systemName: "car").font(.system(size: 40))
            Text("Trips").font(.system(size: 15)).fontWeight(.bold)
        }.padding(10)
    }
}


// MARK: - -  Profile Starts Here
struct ProfileButton: View {
    @Binding var showProfilePage:Bool
    @Binding var showMessagePage:Bool

    var body: some View {
        Button(action: {
            self.showProfilePage = true
            self.showMessagePage = false


        }){
            ProfileButtonContent()
        }
    }
}

struct ProfileButtonContent: View {
    
    var body: some View {
        VStack{
            Image(systemName: "person").font(.system(size: 40))
            Text("Profile").font(.system(size: 15)).fontWeight(.bold)
        }.padding(10).foregroundColor(Color.black)
    }
}




struct Footer_Previews: PreviewProvider {
    @State static var showProfilePage = true
    @State static var showMessagePage = true
    static var previews: some View {
        Footer(showProfilePage: $showProfilePage, showMessagePage: $showMessagePage )
    }
}
