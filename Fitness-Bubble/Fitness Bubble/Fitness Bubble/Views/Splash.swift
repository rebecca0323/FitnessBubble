//
//  Splash.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/25/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI

struct Splash: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Color(red: 1.00, green: 0.78, blue: 0.66).edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    VStack{
                        Text("Fitness Bubble")
                            .font(Font.custom("AvenirNext-Bold", size: 60))
                            .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                            .padding(.bottom, 25.0)
                        Button(action: {
                            self.viewRouter.currentPage = "Friends"
                        }) {
                                Text("Sign In")
                                    .font(Font.custom("AvenirNext-Bold", size: 20))
                                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                                    .padding(.horizontal, 20.0)
                                    .frame(width: 210.0, height: 54.0)
                            
                        }
                    .background(Color(red: 0.75, green: 0.73, blue: 0.93))
                        .cornerRadius(/*@START_MENU_TOKEN@*/27.0/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 10.0)
                        Spacer()
                        
                        //Next button (Register button)
                        Button(action: {
                            self.viewRouter.currentPage = "Register"
                        }) {
                                    Text("Register")
                                        .font(Font.custom("AvenirNext-Bold", size: 20))
                                        .foregroundColor(Color(red: 0.75, green: 0.73, blue: 0.93))
                                        .padding(.horizontal, 20.0)
                                        .frame(width: 210.0, height: 54.0)
                                
                            }
                        .background(Color(red: 0.07, green: 0.23, blue: 0.65))
                            .cornerRadius(/*@START_MENU_TOKEN@*/27.0/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 10.0)
                        
                        
                    }.padding(.top, 30.0)
                    
                    
                    Spacer()
                }
                .padding(.leading, 40.0)
                Spacer()
                Image("main").edgesIgnoringSafeArea(.all)
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash(viewRouter: ViewRouter())
    }
}
