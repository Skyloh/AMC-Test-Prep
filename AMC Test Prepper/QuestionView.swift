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
    
    /*
     while caching strings may improve on program speed, it's not really important
     to us (yet). This means that we can use a more simple and compact solution.
     */
    
    //@State var ans = "The Solution is Hidden"
    
    
    //Temporary text variable for trying to make text segmentation work
    @State var temp: String = "Lorem ipsum dolor sit amet |0| consectetur adipiscing elit |1| sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n |3| \n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur |0| Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
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
                    
                    
                    /*
                     Split string uses .components with parameter '{'
                     use for each loop
                     */
                    
                    //Displaying question
                    //we'll need a way to dynamically change font size so that
                    //the whole problem can fit on the screen
                    //Old version of diplaying the question
                    //Problem: Cannnot warp with images
                    /*
                     Text(question.problemText)
                     .frame(width: 300)
                     .padding(.vertical, 40)
                     //.background(Color("atpBlue"))
                     .cornerRadius(8)
                     .foregroundColor(Color("atpSky"))
                     .font(.custom("GillSans", size: 20))
                     */
                    
                    //New way to present the question by using the ForEach loop
                    
                    Spacer()
                   
                    
//UNCOMMENT EACH BLOCK ONE AT A TIME TO CHECK FOR ERRORS
                    
                    ForEach(0 ..< self.question.problemText.count) { part in

//                        //Check if the text is just a number and only if it is not just another display it
//                        if self.question.problemText[part].rangeOfCharacter(from: CharacterSet.decimalDigits) == nil{
//
//                            Text(self.question.problemText[part])
//                                .frame(width: 300)
//                                .padding(.vertical, 20)
//                                .cornerRadius(8)
//                                .foregroundColor(Color("atpSky"))
//                                .font(.custom("GillSans", size: 20))
//                        }
//
//                        else{
//                            print("test: " + self.question.problemText[part])
//                            self.question.loadFromIndex(index: Int(self.question.problemText[part])!)
//
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 20)
//                                .background(Color("atpSky"))
//                                .cornerRadius(8)
//                        }



                    }
                    
                    
                    //Spacer()
                    
                    
                    //Show Answer
                    //in this solution to the displaying text issue, rather than hardcoding the
                    //string in the editor, we leave it up to the computer at runtime with a ternary operator.
//                    Text(self.showing ? self.question.solutionText[0] : "The Solution is Hidden")
//                        .frame(width: 300)
//                        .padding(.vertical, 20)
//                        //.background(Color("atpBlue"))
//                        //.cornerRadius(8)
//                        .foregroundColor(Color("atpSky"))
//                        .font(.custom("GillSans", size: 20))
                    
                    
//                    Button(action: {
//                        //.toggle is a boolean-only method that just swaps the boolean value
//                        self.showing.toggle()
//                    }) {
//                        //same idea as the comment in Show Answer, but applied to the Button
//                        Text(self.showing ? "Hide Solution" : "Show Solution")
//                            .frame(width: 300)
//                            .padding(.vertical, 20)
//                            .background(Color("atpMagenta"))
//                            .cornerRadius(8)
//                            .foregroundColor(Color("atpSky"))
//                            .font(.custom("GillSans", size: 20))
//
//                    }
                    
//                    Spacer()
//
//                    //Next Question
//                    Button(action: {
//                        self.showing = false
//                        print(self.question.solutionText)
//                        self.question = Question()
//                    }) {
//                        Text("Next Question")
//                            .frame(width: 300)
//                            .padding(.vertical, 20)
//                            .background(Color("atpMagenta"))
//                            .cornerRadius(8)
//                            .foregroundColor(Color("atpSky"))
//                            .font(.custom("GillSans", size: 20))
//
//                    }
                    
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
