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
    
    @State var question = Question()
    
    //this boolean variable stores whether or not we are showing the solution.
    @State var showing : Bool = false
    
    /*
     while caching strings may improve on program speed, it's not really important
     to us (yet). This means that we can use a more simple and compact solution.
     */
    
    //@State var ans = "The Solution is Hidden"
    
    var body: some View {
        
        
        /*
         ====PROBLEM CASES THAT NEED FIGURING OUT====
         > https://artofproblemsolving.com/wiki/index.php/2016_AMC_8_Problems/Problem_8
         
            https://artofproblemsolving.com/wiki/index.php/2013_AMC_8_Problems/Problem_3
         
         */
        
        ZStack{
            
            Rectangle().fill(Color("atpBlack"))
            
            VStack{
                
                //Displaying question
                    //we'll need a way to dynamically change font size so that
                    //the whole problem can fit on the screen
                Text(question.problemText)
                    .frame(width: 300)
                    .padding(.vertical, 40)
                    //.background(Color("atpBlue"))
                    .cornerRadius(8)
                    .foregroundColor(Color("atpSky"))
                
                
                question.loadFromIndex(index:0)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                    .padding()
                
                
                /*
                 This chunk of code isn't a great idea because it has the precondition:
                    question.imageUrl.count > 1
                 
                 This precondition is failed for questions that don't have more than 1
                 image associated with them, for example:
                    >https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_19
                 
                 a better way to go about this would be something similar to the Contacts
                 project we did, like a ForEach loop or something.
                 ---------------------------
                 question.loadFromIndex(index:1)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 200, height: 50)
                 */
                
                //Spacer()
                
                
                //Show Answer
                //in this solution to the displaying text issue, rather than hardcoding the
                //string in the editor, we leave it up to the computer at runtime with a ternary operator.
                Text(self.showing ? self.question.solutionText : "The Solution is Hidden")
                    .frame(width: 300)
                    .padding(.vertical, 20)
                    //.background(Color("atpBlue"))
                    .cornerRadius(8)
                    .foregroundColor(Color("atpSky"))
                
                Button(action: {
                    //.toggle is a boolean-only method that just swaps the boolean value
                    self.showing.toggle()
                }) {
                    //same idea as the comment in Show Answer, but applied to the Button
                    Text(self.showing ? "Hide Solution" : "Show Solution")
                        .frame(width: 300)
                        .padding(.vertical, 20)
                        .background(Color("atpMagenta"))
                        .cornerRadius(8)
                        .foregroundColor(Color("atpSky"))
                }
                
                Spacer()
                
                //Next Question
                Button(action: {
                    self.showing = false
                    print(self.question.solutionText)
                    self.question = Question()
                }) {
                    Text("Next Question")
                        .frame(width: 300)
                        .padding(.vertical, 20)
                        .background(Color("atpMagenta"))
                        .cornerRadius(8)
                        .foregroundColor(Color("atpSky"))
                }
                
            }
            
        }
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
