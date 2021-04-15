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
//change 11/14

struct homeView: View {
    
    @State private var count = 0
    @State var showing = false
    
    var body: some View {
        
        ZStack{
            Rectangle().fill(Color("color1"))
            
            VStack{
                
                Spacer()
                
                Text("AMC Test Prep").foregroundColor(Color("color4"))
                Image("temp").resizable().aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Button("Open Question View", action: {
                    
                    //self.showing.toggle()
                    
                    print(Question.text(site: "https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_16"))
                })
                
                Spacer()
                
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
