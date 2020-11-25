//
//  CreateUser.swift
//  DriveChat
//
//  Created by Microapples on 8/10/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage



func CreateUser(name: String,age : String,imagedata : Data,completion : @escaping (Bool)-> Void){
    
    let db = Firestore.firestore()
    
    let storage = Storage.storage().reference()
    
    let uid = Auth.auth().currentUser?.uid
    
    storage.child("profilepics").child(uid!).putData(imagedata, metadata: nil) { (_, err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
        
        storage.child("profilepics").child(uid!).downloadURL { (url, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            db.collection("users").document(uid!).setData(["name":name,"age":age,"pic":"\(url!)","uid":uid!]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                completion(true)
                
                UserDefaults.standard.set(true, forKey: "status")
                
                UserDefaults.standard.set(name, forKey: "UserName")
                
                UserDefaults.standard.set(uid, forKey: "UID")
                
                UserDefaults.standard.set("\(url!)", forKey: "pic")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }
            }
        }
    }
}
