//
//  TestingView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/14/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//


//THIS VIEW IS NOT USED IN PROJECT, ONLY TO TEST THINGS
import SwiftUI

struct TestingView: View {
    
    @State var question = Question()
    
    var body: some View {
        
        ZStack{
            
            Rectangle().fill(colors[Int.random(in: 0..<colors.count)])
            
            VStack{
                
                Text(question.problemText).padding()
                
                Spacer()
                
                question.loadFromIndex(index: 0).resizable().aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text(question.solutionText).padding()
                
                
                Button(action: {
                    
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
