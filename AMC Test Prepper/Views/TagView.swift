//
//  TagView.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/27/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
import UIKit
struct TagView: View {
    
    
    //this string var stores the TextField input, which is the tag
    @State var tagStringInput: String = ""
    //this boolean variable stores whether or not the TextField for tag input is showing
    @State var showingTagInput: Bool = false
    //was tryna append all of the tags for a question to one string, so it could be used in Text() easily
    //@State var listOfTags: String = ""
    
    /*
     while caching strings may improve on program speed, it's not really important
     to us (yet). This means that we can use a more simple and compact solution.
     */
    


    
    var body: some View {
        
        ZStack{
            
            Rectangle().fill(Color("atpBlack"))
            
            VStack{
                Text("Swipe Down...")
                    .frame(width: 400)
                    .background(Color.white)
                
                
                Spacer()
                
                HStack{
                    //tag button
                    Button(action: {
                        print("tag here")
                        // do stuff with .showing, make a similar system, pass data to firebase to store it,
                    }) {
                        Text("Tag:")
                            .frame(width: 100)
                            .padding(.vertical, 15)
                            .background(Color("atpMagenta"))
                            .cornerRadius(8)
                            .foregroundColor(Color("atpSky"))
                    }
                    Spacer()
                    
                    //user input for tag
                    TextField("Type custom tag here...", text: self.$tagStringInput)
                        .background(Color.white)
                    
                    // uhh what did this do again? //(self.showingTagInput ? "" : "Type here... "), text:

                    Spacer()
                    
                    // save tag button
                    Button(action: {
                        print("\(self.tagStringInput) : This is the direct tagString input")
                        //can modify next comment to add character limit
//                        if let _:String = self.tagStringInput {
                        
                        //adds tag string with question ID to IDTagObject, then appendsthe object to IDTag array
                        TagMaker().IDTagArr.append([self.tagStringInput, (TagMaker().IDArr[TagMaker().IDArr.count - 1])])
                        //print(TagMaker().tagArr[0]) //[TagMaker().tagArr.count - 1])
                        print("above is tag string, below is tag id")
                        //error in this line, maybe cause Question() doesnt run thru its initializers the first time around? it probably has to tho, so idk why the IDArr doesnt have anything appended to it
                        print(TagMaker().IDArr[0]) //[TagMaker().IDArr.count - 1])
                        print("above is important")
                        print(TagMaker().IDTagArr[0])
                        print("below is arr size")
                        print(TagMaker().IDArr.count)

                        
                        //this is stupid, just shows that the tag the user just inputted is actually a part of the array of IDTag objects.
                        //print("\(TagMaker().getWholeIDTagArr()[ TagMaker().getIDTagArrSize() ].getTagString()): last index here")
                        //basically its print(TagMaker->ArrayObject->at its final index->get the tag string of the object at that index
                        
                        
                        //list of tags is used to append all tags associated with a quesiton into one string
                        //so that its easier to output using Text()
                       // self.listOfTags = "\(TagMaker().getQuestionsIDTagArr(id: self.question.ID))"
                        //tries to print list of all previously entered tags of the current question into console
                       // print("\(TagMaker().getQuestionsIDTagArr(id: self.question.ID)): this is all the tag string inputs associated with the current question ")
                           
                        self.showingTagInput = false
                        //} else{print("not saved!! ALERT ALERT TagView line 70")}
                    }) {
                        Text("Create")
                            .frame(width: 100)
                            .padding(.vertical, 15)
                            .background(Color("atpMagenta"))
                            .cornerRadius(8)
                            .foregroundColor(Color("atpSky"))
                    }
                    
                }.sheet(isPresented: $showingTagInput){
                    //does this toggle showingTagInput?
                    QuestionView()
                }
                Spacer()
                
//                Cant get this to work, was gonna show user the previous tags they wrote
                HStack{
                    Text("\(TagMaker().tagArr[TagMaker().tagArr.count - 1])")
               }
                Spacer()
            }
        }
        
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
