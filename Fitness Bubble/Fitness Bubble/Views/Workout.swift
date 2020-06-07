//
//  Workout.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI

struct Workout: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    @State private var timeRemaining = 15
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle().frame(height: 250.0).foregroundColor(Color(red: 0.75, green: 0.73, blue: 0.93)).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Fitness Bubble")
                    .font(Font.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                        .padding(.bottom, 70)
                    Text("CARDIO")
                    .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                    .font(Font.custom("Bodoni72C", size: 50))
                        .padding(.bottom, 50)
                }
            }
            ZStack{
                Circle().foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66)).padding(.all, 30.0)
                Circle().foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00)).padding(.all, 70.0)
                Text("00:"+"\(timeRemaining)")
                .font(Font.custom("AvenirNext-Bold", size: 60))
                .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
            }
            Spacer()
            Button(action: {}) {
                    Text("pause")
                        .font(Font.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                        .padding(.horizontal, 20.0)
                        .frame(width: 210.0, height: 54.0)
            }.background(Color(red: 0.07, green: 0.23, blue: 0.65))
            .cornerRadius(/*@START_MENU_TOKEN@*/27.0/*@END_MENU_TOKEN@*/)
            .shadow(radius: 10.0)
                .padding(.vertical, 30.0)
            Spacer()
        }
        .onReceive(timer){
            time in
            if self.timeRemaining>0{
                self.timeRemaining-=1
            }
            else{
                self.viewRouter.currentPage = "UploadPicture"
            }
        }
        
    }
}

struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        Workout(viewRouter: ViewRouter())
    }
}
