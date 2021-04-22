//
//  TestingView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/14/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct TestingView: View {
    
    //@State var question = Question()
    
    let colors = [Color.purple, Color.blue, Color.pink, Color.yellow, Color("color2")]
    
    var body: some View {
        
        //was a ZStack
        VStack{
            
            Rectangle().fill(colors[Int.random(in: 0..<colors.count)])
            
            Button(action: {
                Scraper.meme(site: "https://artofproblemsolving.com/wiki/index.php/2018_AMC_8_Problems/Problem_1")
            }) {
                Text("Next Question")
                    .frame(width: 200)
                    .padding(.vertical, 15)
                    .background(Color("color3"))
                    .cornerRadius(8)
                    .foregroundColor(Color("color2"))
            }
            
            /*
            VStack{
                
                Text(question.problemText).padding()
                
                Spacer()
                
                question.loadFromIndex(index: 0).resizable().aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text(question.solutionText).padding()
                
                
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
 */
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
