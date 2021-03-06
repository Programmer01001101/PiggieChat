//
//  ChatView.swift
//  DriveChat
//
//  Created by Microapples on 8/17/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth


struct ChatView : View {
    
    
    @Binding var chat : Bool
    @State var msgs = [Msg]()
    @State var txt = ""
    @State var nomsgs = false
    
    var name : String
    var pic : String
    var uid : String
    
    var body : some View{
        
        VStack{
            if msgs.count == 0{
                if self.nomsgs{
                    Text("Start New Conversation !!!").foregroundColor(Color.black.opacity(0.5)).padding(.top)
                    Spacer()
                }
                else{
                    Spacer()
                    Indicator()
                    Spacer()
                }
            }
            else{
                MsgHistory(msgs: $msgs)
            }
            
            MsgSendBox(txt: $txt, chat: $chat, name: name , pic: pic, uid: uid)
            
        }.padding()
        .onAppear {
            self.getMsgs()
        }
    }
    
    func getMsgs(){
        
        let db = Firestore.firestore()
        
        let uid = Auth.auth().currentUser?.uid
        
        db.collection("msgs").document(uid!).collection(self.uid).order(by: "date", descending: false).addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                self.nomsgs = true
                return
            }
            
            if snap!.isEmpty{
                
                self.nomsgs = true
            }
            
            for i in snap!.documentChanges{
                
                if i.type == .added{
                    
                    
                    let id = i.document.documentID
                    let msg = i.document.get("msg") as! String
                    let user = i.document.get("user") as! String
                    
                    self.msgs.append(Msg(id: id, msg: msg, user: user))
                }

            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    @State static var chat = true
    @State static var name = "Bill"
    @State static var pic = "pic"
    @State static var uid = "uid"


    static var previews: some View {
        ChatView(chat: $chat, name: name, pic: pic, uid: uid)
    }
}

struct MsgHistory: View {
    @Binding var msgs:[Msg]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 8){
                
                ForEach(self.msgs){i in
                    HStack{
                        
                        if i.user == UserDefaults.standard.value(forKey: "UID") as! String{
                            
                            Spacer()
                            
                            Text(i.msg)
                                .padding()
                                .background(Color.blue)
                                .clipShape(ChatBubble(mymsg: true))
                                .foregroundColor(.white)
                        }
                        else{
                            
                            Text(i.msg).padding().background(Color.green).clipShape(ChatBubble(mymsg: false)).foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                    
                }
            }
        }
    }
}

struct MsgSendBox: View {
    @Binding var txt:String
    @Binding var chat:Bool
    var name : String
    var pic : String
    var uid : String
    
    var body: some View {
        HStack{
            
            TextField("Enter Message", text: self.$txt).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                
                SendMsg(user: self.name, uid: self.uid, pic: self.pic, date: Date(), msg: self.txt)
                
                self.txt = ""
                
            }) {
                
                Text("Send")
            }
        }
            
        .navigationBarTitle("\(name)",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.chat.toggle()
            
        }, label: {
            
            Image(systemName: "arrow.left").resizable().frame(width: 20, height: 15)
            
        }))
    }
}
