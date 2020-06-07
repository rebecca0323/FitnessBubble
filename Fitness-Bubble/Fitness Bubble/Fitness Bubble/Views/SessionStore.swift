//
//  SessionStore.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/25/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SessionStore: ObservableObject {
    
    //properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    @Published var items: [TODOS] = []

    var ref: DatabaseReference = Database.database().reference()
    
    //functions
    func listen() {
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        }
    }
    
    //log in
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.session = nil

    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        addToGroup()
    }
    
    func addToGroup(){
        if Auth.auth().currentUser != nil{
            let uid = Auth.auth().currentUser?.uid
            self.ref.child("Groups").child("Metrohacks").child(uid ?? "error").setValue(["id": uid])
            self.ref.child("Groups").child("Metrohacks").child("Streak").setValue(["Streak": "5 days"])
        }
    }
    
}
