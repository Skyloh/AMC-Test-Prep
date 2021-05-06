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
    
    @State var question = Question(site: "https://artofproblemsolving.com/wiki/index.php/2013_AMC_8_Problems/Problem_13")
    
    //this boolean variable stores whether or not we are showing the solution.
    @State var showing : Bool = false
    
    // hardcoded urls for presentation
    @State var questionURLs : [String] =
    ["https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_23",
    "https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_1",
    "https://artofproblemsolving.com/wiki/index.php/2015_AMC_8_Problems/Problem_11",
    "https://artofproblemsolving.com/wiki/index.php/2017_AMC_8_Problems/Problem_23",
    "https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_24"]
    
    var body: some View {
        
        
        ZStack{
            
            Rectangle().fill(Color("atpBlack"))
            
            ScrollView{
                VStack{
                    
                    //New way to present the question by using the ForEach loop
                    
                    Spacer()
                    
                    
                    ForEach(self.question.problemText, id: \.self) { string in
                        
                        HStack{
                            //cannot have if statements in a ForEach without a Group
                            Group{
                                
                                //is the string capable of being an int?
                                if Int(string) == nil{
                                    
                                    Text(string)
                                        .frame(width: 300)
                                        .padding(.vertical, 10)
                                        .cornerRadius(8)
                                        .foregroundColor(Color("atpSky"))
                                        .font(.custom("GillSans", size: 20))
                                }
                                    
                                else{
                                    
                                    
                                    self.question.loadFromIndex(index: Int(string)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        //.frame(width: 300)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(Color("atpSky"))
                                        .cornerRadius(8)
                                        .border(Color("atpBlue"), width: 7)
                                        .cornerRadius(10)
                                    
                                }
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                    if showing {
                        ForEach(self.question.solutionText, id: \.self) { string in
                            
                            Group {
                                
                                if Int(string) == nil {
                                    Text(string)
                                        .frame(width: 300)
                                        .padding(.vertical, 20)
                                        //.background(Color("atpBlue"))
                                        //.cornerRadius(8)
                                        .foregroundColor(Color("atpSky"))
                                        .font(.custom("GillSans", size: 20))
                                }
                                else{
                                    
                                    self.question.loadFromIndex(index: Int(string)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        //.frame(width: 300)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(Color("atpSky"))
                                        .cornerRadius(8)
                                        .border(Color("atpMagenta"), width: 5)
                                    
                                    
                                }
                                
                            }
                            
                        }
                    }
                        
                    else {
                        Text("The solution is hidden...")
                            .frame(width: 300)
                            .padding(.vertical, 20)
                            //.background(Color("atpBlue"))
                            //.cornerRadius(8)
                            .foregroundColor(Color("atpSky"))
                            .font(.custom("GillSans", size: 20))
                    }
                    
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
                        
                        if self.questionURLs.count == 0 {
                            self.questionURLs.append("https://artofproblemsolving.com/wiki/index.php/20\(Int.random(in: 10..<20))_AMC_8_Problems/Problem_\(Int.random(in: 1..<23))")
                        }
                        
                        self.question = Question(site: self.questionURLs.remove(at: self.questionURLs.count-1))
                        
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
