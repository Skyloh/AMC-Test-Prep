//
//  TestingView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/14/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct TestingView: View {
    
    @State var question = Question()
    
    let colors = [Color.purple, Color.blue, Color.pink, Color.yellow, Color("color2")]
    
    var body: some View {
        
        ZStack{
            
            Rectangle().fill(colors[Int.random(in: 0..<colors.count)])
            
            VStack{
                
                Text(question.problemText)
                
                Spacer()
                
                question.loadFromIndex(index: 0).resizable().aspectRatio(contentMode: .fit)
                
                Spacer()
                
                
                Text(question.solutionText)
                
                
                Button(action: {
                    print(self.question.formatTextWithImages())
                    self.question = Question()
                }) {
                    Text("Next Question")
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .background(Color("color3"))
                        .cornerRadius(8)
                        .foregroundColor(Color("color2"))
                }
                
            }
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
