//
//  TestingView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/14/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct TestingView: View {
    
    @State var question = Question(site: "https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_16")
    
    var body: some View {
        VStack{
            Text(question.problemText)
            question.loadFromIndex(index: 0).resizable().aspectRatio(contentMode: .fit)
            Text(question.solutionText)
            
            Button("Next", action: {
                self.question = Question()
            })
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
