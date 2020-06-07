//
//  Register.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI

struct Register: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var group: String = ""
    
    @ObservedObject var session: SessionStore
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack{
            Color(red: 1.00, green: 0.78, blue: 0.66).edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    VStack{
                        Text("Welcome,")
                            .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                            .font(Font.custom("AvenirNext-Bold", size: 40))
                            .padding(.top, 100.0)
                        Text("Sign up to Continue").padding()
                        .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                        .font(Font.custom("AvenirNext-Regular", size: 20))
                    }.padding()
                    Spacer()
                }
                
                //EMAIL
                TextField("Email Address", text: $email).frame(width: 280, height: 20).padding()
                    .background(Color(red: 0.75, green: 0.73, blue: 0.93))
                    .cornerRadius(30)
                Spacer()
                //Password
                SecureField("Password", text: $password).frame(width: 280, height: 20).padding()
                .background(Color(red: 0.75, green: 0.73, blue: 0.93))
                .cornerRadius(30)
                
                Spacer()
                //Full name
                TextField("Full Name", text: $name).frame(width: 280, height: 20).padding()
                .background(Color(red: 0.75, green: 0.73, blue: 0.93))
                .cornerRadius(30)
                Spacer()
                //Group Name
                TextField("Group Name", text: $group).frame(width: 280, height: 20).padding()
                .background(Color(red: 0.75, green: 0.73, blue: 0.93))
                .cornerRadius(30)
            
                ZStack{
                    VStack{
                        Rectangle().padding(0.0).foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                        Rectangle().padding(0.0).foregroundColor(Color(red: 0.75, green: 0.73, blue: 0.93))
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            self.signUp()
                        }) {
                            Image("arrow").foregroundColor(.white)
                            .padding()
                        }.background(RoundedRectangle(cornerRadius: 29.5).foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65)))
                    }.padding(.trailing, 50.0)
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
    
    //Sign up
    func signUp() {
        if !email.isEmpty && !password.isEmpty {
            session.signUp(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    self.email = ""
                    self.password = ""
                    self.name = ""
                    self.group = ""
                    self.viewRouter.currentPage = "Home"
                }
            }
        }
    }
    
    
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(session: SessionStore(), viewRouter: ViewRouter())
    }
}
