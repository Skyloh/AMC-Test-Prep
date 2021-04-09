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
    
    @State var question = Question(site: "https://artofproblemsolving.com/wiki/index.php/2018_AMC_8_Problems/Problem_4")
    
    var body: some View {
        
        //this is an Image object, so modifiers should work on it
        question.loadFromIndex(index: 3)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
