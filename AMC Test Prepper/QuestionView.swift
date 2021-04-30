//
//  QuestionView.swift
//  AMC Test Prepper
//
//  Created by Alexander Nikolov (student LM) on 4/15/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
//delete this aaaaaaaa***

//This is the flashcard view (main question mode)
struct QuestionView: View {
    
    @State var question = Question()
    
    //this boolean variable stores whether or not we are showing the solution.
    @State var showing : Bool = false
    
    var body: some View {
        
        
        
        /*
         ====PROBLEM CASES THAT NEED FIGURING OUT====
         > https://artofproblemsolving.com/wiki/index.php/2016_AMC_8_Problems/Problem_8
         
         https://artofproblemsolving.com/wiki/index.php/2013_AMC_8_Problems/Problem_3
         
         */
        
        
        ZStack{
            
            Rectangle().fill(Color("atpBlack"))
            
            ScrollView{
                VStack{
                    
                    //New way to present the question by using the ForEach loop
                    
                    Spacer()
                    
                    
                    ForEach(self.question.problemText, id: \.self) { string in
                        
                        //cannot have if statements in a ForEach without a Group
                        Group{
                            
                            //is the string capable of being an int?
                            if Int(string) == nil{
                                
                                Text(string)
                                    .frame(width: 300)
                                    .padding(.vertical, 20)
                                    .cornerRadius(8)
                                    .foregroundColor(Color("atpSky"))
                                    .font(.custom("GillSans", size: 20))
                            }
                                
                            else{
                                self.question.loadFromIndex(index: Int(string)!)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 20)
                                    .background(Color("atpSky"))
                                    .cornerRadius(8)
                                
                            }
                        }
                        
                    }
                    
                    //Show Answer
                    //in this solution to the displaying text issue, rather than hardcoding the
                    //string in the editor, we leave it up to the computer at runtime with a ternary operator.
                    Text(self.showing ? self.question.solutionText[0] : "The Solution is Hidden")
                        .frame(width: 300)
                        .padding(.vertical, 20)
                        //.background(Color("atpBlue"))
                        //.cornerRadius(8)
                        .foregroundColor(Color("atpSky"))
                        .font(.custom("GillSans", size: 20))
                    
                    
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
                            .font(.custom("GillSans", size: 20))
                        
                    }
                    
                    Spacer()
                    
                    //Next Question
                    Button(action: {
                        self.showing = false
                        self.question = Question()
                    }) {
                        Text("Next Question")
                            .frame(width: 300)
                            .padding(.vertical, 20)
                            .background(Color("atpMagenta"))
                            .cornerRadius(8)
                            .foregroundColor(Color("atpSky"))
                            .font(.custom("GillSans", size: 20))
                        
                    }
                    
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
