//
//  ContentView.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var session: SessionStore
    
    var body: some View {
        ZStack{
            if viewRouter.currentPage == "Splash" {
                Splash(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "Register" {
                Register(session: session, viewRouter: viewRouter)
            } else if viewRouter.currentPage == "Home"{
                Home(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "SelectWorkout"{
                SelectWorkout(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "Workout"{
                Workout(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "UploadPicture"{
                UploadPicture(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "Friends"{
                Friends()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
           ContentView(viewRouter: ViewRouter(), session: SessionStore())
       }
}
