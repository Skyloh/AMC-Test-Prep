//
//  QuestionView.swift
//  AMC Test Prepper
//
//  Created by Alexander Nikolov (student LM) on 4/15/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
// bouta sue alex rq

import SwiftUI

struct QuestionView: View {
    
    //hardcoded for presentation, normally would just be
    
    //  @State var question = Question()
    
    @State var question = Question(site: "https://artofproblemsolving.com/wiki/index.php/2013_AMC_8_Problems/Problem_13")
    
    //this boolean variable stores whether or not we are showing the solution.
    @State var showing : Bool = false
    
    /*
     hardcoded urls for presentation
     for some reason, it's dangerous to go beyond these values
     the code just prints a random fatal error I don't know how to fix
    
     
            Fatal error: Index out of range: file /Library/Caches/com.apple.xbs/Sources/swiftlang/swiftlang-1103.2.25.13/swift/stdlib/public/core/ContiguousArrayBuffer.swift, line 444
     
            2021-05-06 08:54:25.625858-0400 AMC Test Prepper[52830:7911508] Fatal error: Index out of range: file /Library/Caches/com.apple.xbs/Sources/swiftlang/swiftlang-1103.2.25.13/swift/stdlib/public/core/ContiguousArrayBuffer.swift, line 444
    
    */
    
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
                    
                    //Spacer()
                    
                    HStack{
                        
                        Text("Question ID:")
                            .foregroundColor(Color("atpSky"))
                            .font(.custom("GillSans", size: 20))
                        
                        Text(String(question.ID))
                            .foregroundColor(Color.black)
                            .font(.custom("GillSans", size: 30))
                        
                    }.frame(width: 300)
                        .padding(.vertical, 10)
                        .background(Color("atpBlue"))
                        .cornerRadius(8)
                    
                    
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
                        
                        HStack {
                            
                            Text(self.showing ? "Hide Solution" : "Show Solution")
                            
                            Image(systemName: self.showing ? "xmark.circle" : "magnifyingglass.circle")
                                .resizable()
                                .frame(width:40,height:40)
                                .padding(.horizontal, 5)
                            
                        }.frame(width: 300)
                            .padding(.vertical, 20)
                            .background(Color("atpMagenta"))
                            .foregroundColor(Color("atpSky"))
                            .font(.custom("GillSans", size: 20))
                        
                    }.border(Color("atpPurple"), width: 3)
                        .cornerRadius(3)
                    
                    
                    Spacer()
                    
                    //Next Question
                    Button(action: {
                        self.showing = false
                        
                        if self.questionURLs.count == 0 {
                            
                            // bad idea to compile random strings at runtime, but I don't really care 😎
                            
                            self.questionURLs.append("https://artofproblemsolving.com/wiki/index.php/20\(Int.random(in: 10..<20))_AMC_8_Problems/Problem_\(Int.random(in: 1..<23))")
                        }
                        
                        self.question = Question(site: self.questionURLs.remove(at: self.questionURLs.count-1))
                        
                    }) {
                        
                        HStack {
                            
                            Text("Next Question")
                            
                            // gotta love systemIcons
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width:20,height:30)
                                .padding(.horizontal)
                            
                        }.frame(width: 300)
                            .padding(.vertical, 20)
                            .background(Color("atpMagenta"))
                            .foregroundColor(Color("atpSky"))
                            .font(.custom("GillSans", size: 20))
                        
                    }.border(Color("atpPurple"), width: 3)
                        .cornerRadius(3)
                        .padding(.all, 5)
                    
                    
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
