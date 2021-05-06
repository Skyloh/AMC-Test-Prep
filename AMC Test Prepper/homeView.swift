//
//  homeView.swift
//  AMC Test Prepper
//
//  Created by Alexander Nikolov (student LM) on 4/6/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

/*
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
 */


struct homeView: View {
    
    @State private var count = 0
    @State var showing = false
    
    var body: some View {
        
        ZStack{
            
            
            //Background color
            Rectangle()
                .fill(Color.black)
            
            Rectangle()
                .fill(Color("atpBlack"))
                .cornerRadius(50)
                .padding(.all, 10)
            
            VStack{
                
                Spacer()
                
                //Logo
                Text("AMC Test Prepper")
                    //.background(Color("atpPurple"))
                    .foregroundColor(Color("atpWhite"))
                    .font(.custom("GillSans", size: 36))
                
                
                
                ZStack{
                    Rectangle()
                        .fill(Color("atpPurple"))
                        .frame(width: 320, height: 320, alignment: .center)
                        .cornerRadius(10)
                    
                    
                    Image("final_icon").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }
                
                Spacer()
                
                //This is the button that will take the user to the single questions
                Button(action: {
                    self.showing.toggle()
                }) {
                    
                    Text("Single Questions")
                        .frame(width: 300)
                        .padding(.vertical, 15)
                        .background(Color("atpMagenta"))
                        .cornerRadius(8)
                        .foregroundColor(Color("atpSky"))
                        .font(.custom("GillSans", size: 20))
                    
                }
                
                Spacer()
                
                Text("Questions by AOPS")
                    .foregroundColor(Color("atpBlue"))
                    .font(.custom("GillSans", size: 20))
                
                Image("aops-logo")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .background(Color("atpWhite"))
                    .border(Color("atpWhite"), width: 5)
                    .cornerRadius(6)
                
                Spacer()
                
                
                
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
