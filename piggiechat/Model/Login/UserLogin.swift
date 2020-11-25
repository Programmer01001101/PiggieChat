//
//  Signin.swift
//  DriveChat
//
//  Created by Microapples on 8/3/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import Foundation

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

import GoogleSignIn



func SignInWithEmail(email:String, password:String,completion: @escaping (Bool,String) -> Void){
    Auth.auth().signIn(withEmail:email,password:password){(res,err) in
        if err != nil{
            completion(false,(err?.localizedDescription)!)
            return
        }
        completion(true,(res?.user.email)!)
    }
}

