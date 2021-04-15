//
//  ContentView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 3/11/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    var body: some View {
        
        ZStack{
            
<<<<<<< Updated upstream
            TestingView()
=======
            QuestionView()
>>>>>>> Stashed changes
            
            /*
            //this is an Image object, so modifiers should work on it
            question.loadFromIndex(index: 3)
                .resizable()
                .aspectRatio(contentMode: .fit)
            //modifiers are not available from the sidebar, you have to look them up yourself :(
             */
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
