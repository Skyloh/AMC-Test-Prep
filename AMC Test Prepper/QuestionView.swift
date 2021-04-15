//
//  QuestionView.swift
//  AMC Test Prepper
//
//  Created by Alexander Nikolov (student LM) on 4/15/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

//This is the flashcard view (main question mode)
struct QuestionView: View {
    
    @State var question = Question(site: "https://artofproblemsolving.com/wiki/index.php/2018_AMC_8_Problems/Problem_1")
     
     var body: some View {
        
        
         VStack{
            
            //Question
            Text("Question Here")
            
            /*
             Text(question.problemText)
             question.loadFromIndex(index: 2).resizable().aspectRatio(contentMode: .fit)
             Text(question.solutionText)
            */
            
            
            //Next Question button
             Button("Next", action: {
                 self.question = Question()
             })
            
            //Show Answer
        
         }
     }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
