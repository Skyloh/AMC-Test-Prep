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
    
    var body: some View {
        
        ZStack{
            Rectangle().fill(Color("color1"))
            
            VStack{
                
                Spacer()
                
                Text("AMC Test Prep *logo to be added").foregroundColor(Color("color4"))
                
                Spacer()
                
                Text("Flash Cards").foregroundColor(Color("color2")).onTapGesture {
                    self.count += 1
                }
                
                Spacer()
                
            }
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
