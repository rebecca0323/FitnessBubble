//
//  Home.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Color(red: 0.07, green: 0.23, blue: 0.65).edgesIgnoringSafeArea(.all)
            //LinearGradient(gradient: Gradient(colors: [Color(red: 0.07, green: 0.23, blue: 0.65), Color(red: 0.07, green: 0.62, blue: 0.65)]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Fitness Bubble")
                .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                .font(Font.custom("AvenirNext-Bold", size: 30))
                .padding(.top, 20.0)
                HStack{
                    VStack{
                        Spacer()
                        HStack{
                            Image("divider")
                            Text("WORKOUT OF THE DAY")
                                .frame(width: 100.0)
                            .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                            .font(Font.custom("AvenirNext-Bold", size: 15))
                            Spacer()
                        }
                        .padding(.top, 200.0)
                        Spacer()
                        Text("CARDIO")
                            .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                            .font(Font.custom("Bodoni72C", size: 60))
                    }
                    Spacer()
                    Image("runninglady")
                        .padding(.bottom)
                }
                VStack{
                    HStack{
                        VStack{
                            ZStack{
                                Rectangle().padding(0.0).foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00))
                                VStack{
                                    Image("workout")
                                    Button(action: {
                                        self.viewRouter.currentPage = "SelectWorkout"
                                    }) {
                                        Text("workout")
                                            .foregroundColor(Color(red: 0.00, green: 0.00, blue: 0.00))
                                        .font(Font.custom("AvenirNext-Bold", size: 20))
                                    }
                                }
                            }
                            ZStack{
                                Rectangle().padding(0.0).foregroundColor(Color(red: 0.75, green: 0.73, blue: 0.93))
                                VStack{
                                    Image("logout")
                                    Button(action: {
                                        self.viewRouter.currentPage = "Splash"
                                    }) {
                                        Text("log out")
                                            .foregroundColor(Color(red: 0.00, green: 0.00, blue: 0.00))
                                        .font(Font.custom("AvenirNext-Bold", size: 20))
                                    }
                                }
                            }
                        }
                        ZStack{
                            Rectangle().padding(0.0).foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                            VStack{
                                Image("friends")
                                Button(action: {
                                    self.viewRouter.currentPage = "Friends"
                                }) {
                                    Text("friends")
                                        .foregroundColor(Color(red: 0.00, green: 0.00, blue: 0.00))
                                    .font(Font.custom("AvenirNext-Bold", size: 20))
                                }
                            }
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewRouter: ViewRouter())
    }
}
