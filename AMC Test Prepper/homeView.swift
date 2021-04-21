//
//  homeView.swift
//  AMC Test Prepper
//
//  Created by Alexander Nikolov (student LM) on 4/6/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
//This is what the user sees once they log-in

struct homeView: View {
    
    //This is a useless count variable to have the button work (delete later)
    @State private var count = 0
    @State var showing = false
    
    var body: some View {
        
        ZStack{
            //Background color
            Rectangle().fill(Color.blue)
            
            VStack{
                
                Spacer()
                
                //Logo is to be added
                Text("AMC Test Prep").foregroundColor(Color.black)
                
                Image("final_icon").resizable().aspectRatio(contentMode: .fit)
                
                Spacer()
                
                //This is the button that will take the user to the flashcards
                Button(action: {
                    self.showing.toggle()
                }) {
                    Text("Single Questions")
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .background(Color("color3"))
                        .cornerRadius(8)
                        .foregroundColor(Color("color2"))
                }
                
                Spacer()
                
                //To Add: More buttons for other studying modes
                
            }
        }.sheet(isPresented: $showing) {
            TestingView()
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
