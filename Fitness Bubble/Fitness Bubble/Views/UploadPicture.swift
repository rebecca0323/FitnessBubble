//
//  UploadPicture.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/24/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import SwiftUI
import FirebaseStorage

struct UploadPicture: View {
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    @ObservedObject var viewRouter: ViewRouter
    
    @State var sourceType:UIImagePickerController.SourceType = .camera
    
    @State var uploadimage:UIImage?
    
    var body: some View {
        ZStack {
                    // gradient background
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.07, green: 0.23, blue: 0.65), Color(red: 0.07, green: 0.62, blue: 0.65)]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                    
                    
                    
                
                    VStack{
                        Image("welldoneimage")
                            .padding()
                            .edgesIgnoringSafeArea(.all)
                            
                        
                        Spacer()
                            .frame(height: 15.0)
                        
                        Text("Well done!")
                            .font(Font.custom("AvenirNext-Bold", size: 50))
                            .foregroundColor(Color.white)
                            
                        
                        
                        Spacer()
                            .frame(height: 30.0)
                        
                        Text("""
        You've completed
        your workout for
        today
        """)
                            .font(Font.custom("AvenirNext-Bold", size: 30))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .padding(.horizontal, 50.0)
                            .lineLimit(/*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .frame(height: 150.0)
                            
                       
                        Spacer()
                    
                        Button(action: {self.showActionSheet = true}) {
                            Text("Take a photo")
                                .font(Font.custom("AvenirNext-Bold", size: 27))
                                .foregroundColor(Color(red: 0.07, green: 0.23, blue: 0.65, opacity: 1.0))
                                .padding(.horizontal, 20.0)
                                .padding(/*@START_MENU_TOKEN@*/.vertical, 12.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 210.0)
                                .background(Color(red: 1.0, green: 0.78, blue: 0.66, opacity: 1.0))
                                
                                .cornerRadius(40)
                        
                        }.actionSheet(isPresented: $showActionSheet){
                            ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
                                //Button1
                                
                                .default(Text("Camera"), action: {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                }),
                                //Button2
                                .default(Text("Photo Library"), action: {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                }),
                                
                                //Button3
                                .cancel()
                                
                            ])
                        }.sheet(isPresented: $showImagePicker){
                            imagePicker(image: self.$uploadimage, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                            
                        }
                        
                        if uploadimage != nil {
                            ZStack{
                                Image(uiImage: uploadimage!)
                                .resizable()
                                .scaledToFit()
                                    .frame(width:300, height:300)
                                
                                Button(action: {self.uploadImage(image: self.uploadimage!)}) {
                                    Text("Upload picture")
                                        .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.0))
                                }
                            }
                        }
                        else{
                            Spacer()
                        }
                    }
                     
                }
    }
    
    
    func uploadImage(image:UIImage){
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            storage.reference().child("temp2").putData(imageData, metadata: nil){
                (_, err) in
                if let err = err {
                    print("an error has occurred - \(err.localizedDescription)")
                } else {
                    print("image uploaded successfully")
                    self.viewRouter.currentPage = "Home"
                }
            }
        } else {
            print("coldn't unwrap/case image to data")
        }
    }
    
}

struct UploadPicture_Previews: PreviewProvider {
    static var previews: some View {
        UploadPicture(viewRouter: ViewRouter())
    }
}
