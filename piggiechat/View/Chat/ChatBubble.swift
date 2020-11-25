//
//  ChatBubble.swift
//  DriveChat
//
//  Created by Microapples on 8/23/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI

struct ChatBubble : Shape {
    
    var mymsg : Bool
    
    func path(in rect: CGRect) -> Path {
            
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,mymsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}


struct ChatBubble_Previews: PreviewProvider {
    @State static var mymsg = true

    static var previews: some View {
        ChatBubble(mymsg: mymsg)
    }
}
