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
//This is a useless count variable to have the button work (delete later)


struct homeView: View {
    
    @State private var count = 0
    @State var showing = false
    
    var body: some View {
        
        ZStack{
            
            
            //Background color
            Rectangle().fill(Color("atpBlack"))
            
            VStack{
                
                 Spacer()
                
                //Logo
                Text("AMC Test Prep")
                    //.background(Color("atpPurple"))
                    .foregroundColor(Color("atpWhite")).font(.system(size:36, weight: .light, design: .serif))
                
                
                Image("final_icon").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                //This is the button that will take the user to the flashcards
                Button(action: {
                    self.showing.toggle()
                }) {
                    Text("Single Questions")
                        .frame(width: 300)
                        .padding(.vertical, 15)
                        .background(Color("atpMagenta"))
                        .cornerRadius(8)
                        .foregroundColor(Color("atpSky"))
                }
                
                Spacer()
                
                
                //To Add: More buttons for other studying modes
                
            }
        }.sheet(isPresented: $showing) {
            QuestionView()
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
