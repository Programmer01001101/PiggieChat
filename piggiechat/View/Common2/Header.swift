//
//  Header.swift
//  DriveChat
//
//  Created by Microapples on 8/3/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI

struct Header: View {
    @Binding var Titletext:String
    var body: some View {
        Text(Titletext)
            .font(.system(size: 35))
            .fontWeight(.bold)
            .foregroundColor(themeblueColor)
            .offset(y:20)
    }
}


struct Header_Previews: PreviewProvider {
    @State private static var title:String = "Title"
    static var previews: some View {
        Header(Titletext: $title)
    }
}
