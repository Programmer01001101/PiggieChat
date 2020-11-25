//
//  CheckUser.swift
//  DriveChat
//
//  Created by Microapples on 8/10/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

func CheckUser(completion: @escaping (Bool,String,String,String)->Void){
     
    let db = Firestore.firestore()
    
    db.collection("users").getDocuments { (snap, err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
        
        for i in snap!.documents{
            
            if i.documentID == Auth.auth().currentUser?.uid{
                
                completion(true,i.get("name") as! String,i.documentID,i.get("pic") as! String)
                return
            }
        }
        
        completion(false,"","","")
    }
    
}
