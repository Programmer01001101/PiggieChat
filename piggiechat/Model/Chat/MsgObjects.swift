//
//  MsgObjects.swift
//  DriveChat
//
//  Created by Microapples on 8/23/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import Foundation

struct User : Identifiable {
    var id : String
    var name : String
    var pic : String
    var age : String
}


struct Msg : Identifiable {
    var id : String
    var msg : String
    var user : String
}

struct Recent : Identifiable {
    var id : String
    var name : String
    var pic : String
    var lastmsg : String
    var time : String
    var date : String
    var stamp : Date
}




