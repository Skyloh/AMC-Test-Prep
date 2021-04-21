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
    @State var ans = "eeee"
    
    var body: some View {
        
        ZStack{
            
            Rectangle().fill(Color("color4"))
            
            VStack{
                
                //Displaying question
                Text(question.problemText).foregroundColor(Color("color1"))
                question.loadFromIndex(index:0).resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 50)
                question.loadFromIndex(index:1).resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 50)
                
                Spacer()
                
                
                //Show Answer
                Text(ans)
                    .frame(width: 300)
                    .padding(.vertical, 50)
                    .cornerRadius(8)
                    .foregroundColor(Color("color1"))
                
                Button(action: {
                    print(self.question.solutionText)
                    self.ans = self.question.solutionText
                }) {
                    Text("Show Solution")
                        .frame(width: 300)
                        .padding(.vertical, 20)
                        .background(Color("color3"))
                        .cornerRadius(8)
                        .foregroundColor(Color("color2"))
                }
                
                Spacer()
                
                //Next Question
                Button(action: {
                    print(self.question.formatTextWithImages())
                    self.question = Question()
                    self.ans = "aaa"
                }) {
                    Text("Next Question")
                        .frame(width: 200)
                        .padding(.vertical, 20)
                        .background(Color("color3"))
                        .cornerRadius(8)
                        .foregroundColor(Color("color2"))
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
