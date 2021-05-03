//
//  TagView.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/27/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct TagView: View {
    
    
    //this string var stores the TextField input, which is the tag
    @State var tagStringInput: String
    //this boolean variable stores whether or not the TextField for tag input is showing
    @State var showingTagInput: Bool //= QuestionView(tagStringInput: .constant("")).showingTagInput
    /*
     
     while caching strings may improve on program speed, it's not really important
     to us (yet). This means that we can use a more simple and compact solution.
     */
    
    
   @State var listOfTags: String = "stoopid Default Value"

    var body: some View {
        
        ZStack{
            
            Rectangle().fill(Color("atpBlack"))
            
            VStack{
                Text("Swipe Down...")
                    .frame(width: 400)
                    .background(Color.white)
                
                
                Spacer() //make spacer that doesnt take up so much room
                
                HStack{
                    //tag button
                    Button(action: {
                        //self.showingTagInput.toggle()
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
                    //maybe add if statement, if changingViews = false. Change it right after

                    Spacer()
                    
                    // save tag button
                    Button(action: {
                        print("\(self.tagStringInput)")
                        //can modify next comment to add character limit
//                        if let _:String = self.tagStringInput {
                        //adds, then accesses arr of IDTagsObjects,

                        TagMaker().addIDTag(IdTag: IDTagObject(tagString: self.tagStringInput))
                        //this is stupid, just shows that the tag the user just inputted is actually a part of the array of IDTag objects.
//                        print("\(TagMaker().getWholeIDTagArr()[(TagMaker().getWholeIDTagArr().count) - 1].getTagString()) WHY DOESNT THIS WORK, and yes, this is the ugliest code ever")
                        
                        self.listOfTags = "\(TagMaker().getQuestionsIDTagArr(id: TempErrorWorkaround().specialGetID() )), "
                        //tries to print list of all previously entered tags of the current question into console
                        print("\(TagMaker().getQuestionsIDTagArr(id: 12345))") //wtf is wrong with this line, it doesnt do anything
                           
                            // DONT CHANGE the showing value HERE, right?
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
                    QuestionView( tagStringInput: .constant(""))
                }
                Spacer()
                
                //Cant get this to work, was gonna show user the previous tags they wrote
//                HStack{
//                    Text("\(TagMaker().getQuestionsIDTagArr(id: 12345))")
//               }
//                Spacer()
            }
        }
        
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tagStringInput: "shouldntSeeThis", showingTagInput: false)
    }
}
