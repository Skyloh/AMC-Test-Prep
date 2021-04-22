//
//  loginHomeView.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/6/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

// put in folders, for subviews as well

struct loginHomeView: View {
    
        @EnvironmentObject var userInfo : UserInfo
        @State private var image : Image = Image("user")
        @State private var inputImage : UIImage?
        @State private var showingImagePicker = false
        
        @State private var address : String = "Adress"
        
        func loadImage(){
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            let database = Database.database().reference().child("user/\(uid)")
            
            database.observeSingleEvent(of: .value) { (snapshot) in
                let postDict = snapshot.value as? [String : AnyObject] ?? [:]
                
                if let photoURL = postDict[""]{
                    self.image = Image(uiImage: LoadImage.loadImage(photoURL as? String))
                }
            }
        }
        
        func saveImage(){
            guard let input = inputImage else {return}

            //saving iAmage in storage
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            //make sure to import FirebaseStorage
            let storage = Storage.storage().reference().child("user/\(uid)")
            
            //compress and convert
            guard let imageData = inputImage?.jpegData(compressionQuality: 0.75) else {return}
            
            //store image
            storage.putData(imageData, metadata: StorageMetadata()) { (metaData, error) in
                //if the storage is successful, metaData will exist
                if let _ = metaData {
                    storage.downloadURL { (url, error) in
                        //guard let uid = Auth.auth().currentUser?.uid else {return}
                        
                        guard let imageURL = url else {return}
                        
                        let database = Database.database().reference().child("user/\(uid)")
                        
                        let userObject : [String : Any] = ["photoURL" : imageURL.absoluteString]
                        
                        database.setValue(userObject)
                    }
                }
            }
        }
        
        func saveAddress(){
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            let database = Database.database().reference().child("user/\(uid)")
            
            let userObject : [String : Any] = ["address" : address]
            
            database.setValue(userObject)
        }
        
        var body: some View {
            VStack{
                
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipped()
                
                Button(action: {
                    
                    self.showingImagePicker = true
                    
                }) {
                    Text("Change Image")
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }.padding()
                
                Button(action: {
                    
                    TextField("address", text: self.$address).autocapitalization(.words)
                    
                    
                    
                }) {
                    Text("Change Address")
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }.padding()
                
                Button(action: {
                    try! Auth.auth().signOut()
                    self.userInfo.isUserAuthenticated = .signedOut
                }) {
                    Text("Sign Out")
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }.sheet(isPresented: $showingImagePicker, onDismiss:
                saveImage
            ){
                ImagePicker(image: self.$inputImage)
            }
            .onAppear {
                self.loadImage()
            }
        }
    }

struct loginHomeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
