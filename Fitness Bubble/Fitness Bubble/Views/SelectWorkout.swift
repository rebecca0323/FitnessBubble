//
//  SelectWorkout.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI

struct SelectWorkout: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            Text("Fitness Bubble").font(Font.custom("AvenirNext-Bold", size: 30))
            .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
            VStack{
                HStack{
                    Text("DAILY")
                        .font(Font.custom("Avenir-Light", size: 30))
                        .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                    Spacer()
                }
                HStack{
                    Text("WORKOUTS")
                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                    .font(Font.custom("Bodoni72C", size: 50))
                    Spacer()
                }.padding(.vertical)
                Text("Train your body for a better and healthier life in quarantine.")
                .font(Font.custom("AvenirNext-Regular", size: 20))
                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                    .lineLimit(3)
                    .frame(height: 60.0)
            }.padding(.horizontal, 50.0)
                .padding(.vertical, 75.0)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    
                    //CARDIO
                    ZStack{
                        Rectangle().foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                        .cornerRadius(40)
                        VStack{
                            Image("runningicon").padding(.bottom, 20)
                            HStack{
                                Text("Cardio").font(Font.custom("Bodoni72C", size: 30))
                                    .padding(.leading, 40)
                                    .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                                Spacer()
                            }.padding(.bottom, 5)
                            HStack{
                                Text("40 minutes").font(Font.custom("Bodoni72C", size: 20))
                                    .padding(.leading, 40)
                                    .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                                Spacer()
                            }
                            .padding(.bottom, 20)
                            Button(action: {
                                self.viewRouter.currentPage = "Workout"
                            }) {
                                    Text("Start")
                                        .font(Font.custom("AvenirNext-Bold", size: 20))
                                        .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                                        .padding(.horizontal, 20.0)
                                        .frame(width: 93.0, height: 41.0)
                                
                            }.background(Color(red: 1.00, green: 1.00, blue: 1.00))
                            .cornerRadius(/*@START_MENU_TOKEN@*/27.0/*@END_MENU_TOKEN@*/)
                            .shadow(radius: 10.0)
                        }
                    }.frame(width: 200, height: 290)
                        .padding(.leading, 30)
                    
                    
                    
                    //WEIGHTLIFTING
                    ZStack{
                        Rectangle().foregroundColor(Color(red: 0.91, green: 0.92, blue: 0.96))
                        .cornerRadius(40)
                        VStack{
                            Image("liftingicon").padding(.bottom, 10)
                            HStack{
                                Text("Weights").font(Font.custom("Bodoni72C", size: 30))
                                    .padding(.leading, 40)
                                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                                Spacer()
                            }.padding(.bottom, 5)
                            HStack{
                                Text("30 minutes").font(Font.custom("Bodoni72C", size: 20))
                                    .padding(.leading, 40)
                                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                                Spacer()
                            }
                            .padding(.bottom, 20)
                            Button(action: {
                                self.viewRouter.currentPage = "Workout"
                            }) {
                                    Text("Start")
                                        .font(Font.custom("AvenirNext-Bold", size: 20))
                                        .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                                        .padding(.horizontal, 20.0)
                                        .frame(width: 93.0, height: 41.0)
                                
                            }.background(Color(red: 1.00, green: 1.00, blue: 1.00))
                            .cornerRadius(/*@START_MENU_TOKEN@*/27.0/*@END_MENU_TOKEN@*/)
                            .shadow(radius: 10.0)
                        }
                    }.frame(width: 200, height: 290)
                        .padding(.leading, 30)
                    
                }.padding(.bottom, 80)
            }
            Spacer()
            
            //BOTTOM
            Rectangle().foregroundColor(Color(red: 0.75, green: 0.73, blue: 0.93))
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct SelectWorkout_Previews: PreviewProvider {
    static var previews: some View {
        SelectWorkout(viewRouter: ViewRouter())
    }
}
