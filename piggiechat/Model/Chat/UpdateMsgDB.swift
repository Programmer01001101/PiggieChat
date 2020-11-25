//
//  UpdateRecents.swift
//  DriveChat
//
//  Created by Microapples on 8/22/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth



func SetRecents(user: String,uid: String,pic: String,msg: String,date: Date){
    
    let db = Firestore.firestore()
    
    let myuid = Auth.auth().currentUser?.uid
    
    let myname = UserDefaults.standard.value(forKey: "UserName") as! String
    
    let mypic = UserDefaults.standard.value(forKey: "pic") as! String
    
    db.collection("users").document(uid).collection("recent").document(myuid!).setData(["name":myname,"pic":mypic,"lastmsg":msg,"date":date]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
    }
    
    db.collection("users").document(myuid!).collection("recent").document(uid).setData(["name":user,"pic":pic,"lastmsg":msg,"date":date]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
    }
}


func UpdateRecents(uid: String,lastmsg: String,date: Date){
    
    let db = Firestore.firestore()
    
    let myuid = Auth.auth().currentUser?.uid
    
    db.collection("users").document(uid).collection("recent").document(myuid!).updateData(["lastmsg":lastmsg,"date":date])
    
     db.collection("users").document(myuid!).collection("recent").document(uid).updateData(["lastmsg":lastmsg,"date":date])
}


func UpdateDB(uid: String,msg: String,date: Date){
    
    let db = Firestore.firestore()
    
    let myuid = Auth.auth().currentUser?.uid
    
    db.collection("msgs").document(uid).collection(myuid!).document().setData(["msg":msg,"user":myuid!,"date":date]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
    }
    
    db.collection("msgs").document(myuid!).collection(uid).document().setData(["msg":msg,"user":myuid!,"date":date]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
    }
}

func SendMsg(user: String,uid: String,pic: String,date: Date,msg: String){
    
    let db = Firestore.firestore()
    
    let myuid = Auth.auth().currentUser?.uid
    
    db.collection("users").document(uid).collection("recent").document(myuid!).getDocument { (snap, err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            // if there is no recents records....
            
            SetRecents(user: user, uid: uid, pic: pic, msg: msg, date: date)
            return
        }
        
        if !snap!.exists{
            
            SetRecents(user: user, uid: uid, pic: pic, msg: msg, date: date)
        }
        else{
            
            UpdateRecents(uid: uid, lastmsg: msg, date: date)
        }
    }
    
    UpdateDB(uid: uid, msg: msg, date: date)
}
