//
//  Friends.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct Friends: View {
    
    @State var streak: String? = "5 days"
    let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/fitness-bubble.appspot.com/o/temp1?alt=media&token=cfd64fe6-42be-49b3-8165-1a15c06c7d07")!
    
    let url2 = URL(string: "https://firebasestorage.googleapis.com/v0/b/fitness-bubble.appspot.com/o/temp?alt=media&token=69393ee0-454c-4bca-b870-9a62f1e9f3e1")!
    
    var body: some View {
        VStack{
            Text("Fitness Bubble").font(Font.custom("AvenirNext-Bold", size: 30))
            .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
            VStack{
                HStack{
                    Text("Metrohacks")
                        .font(Font.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65))
                    Spacer()
                    Text("\(streak!)").font(Font.custom("AvenirNext-Bold", size: 20))
                    .foregroundColor(Color(red: 0.00, green: 0.00, blue: 0.00))
                    Image("fire")
                }
            }.padding(.horizontal, 50.0)
                .padding(.vertical, 75.0)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    
                    //Friend
                    ZStack{
                        Rectangle().foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                        .cornerRadius(40)
                        
                        VStack{
                            AsyncImage(
                                url: url,
                                placeholder: Text("Loading ...")
                                
                            ).aspectRatio(contentMode: .fit)
                            
                            Text("Rebecca").font(Font.custom("AvenirNext-Bold", size: 27))
                            .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65, opacity: 1.0))
                        }
                        
                        
                    }.frame(width: 300, height: 425)
                        .padding(.leading, 30)
                    
                    
                    //Friend2
                    
                    ZStack{
                        Rectangle().foregroundColor(Color(red: 1.00, green: 0.78, blue: 0.66))
                        .cornerRadius(40)
                        
                        VStack{
                            AsyncImage(
                                url: url2,
                                placeholder: Text("Loading ...")
                                
                            ).aspectRatio(contentMode: .fit)
                            
                            Text("Min and Ellie").font(Font.custom("AvenirNext-Bold", size: 27))
                            .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65, opacity: 1.0))
                        }
                        
                        
                    }.frame(width: 300, height: 425)
                        .padding(.leading, 30)
                    
                    
                }.padding(.bottom, 80)
            }
            Spacer()
            
            //BOTTOM
            Rectangle().foregroundColor(Color(red: 0.75, green: 0.73, blue: 0.93))
        }.edgesIgnoringSafeArea(.bottom)
        
    }
}

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
        .padding()
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}
