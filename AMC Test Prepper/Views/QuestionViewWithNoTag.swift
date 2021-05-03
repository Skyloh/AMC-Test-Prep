//
//  QuestionViewWithNoTag.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/30/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct QuestionViewWithNoTag: View{
    var body: some View {
        Text("aaa")
        
        
        // here are some old broken saves of tagView and QuestionView. Delete this file if u see it, cause I (nathan c) forgot to delete it before I commited and pushed to merge w/ main.
        /*
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
            @Binding var tagStringInput: String
            //this boolean variable stores whether or not the TextField for tag input is showing
            @State var showingTagInput: Bool = QuestionView(tagStringInput: .constant("")).showingTagInput
           //screw this it creates too many errors public var tempCopyOfTag: String
            /*
             while caching strings may improve on program speed, it's not really important
             to us (yet). This means that we can use a more simple and compact solution.
             */
            
            //@State var ans = "The Solution is Hidden"
            
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
                            TextField((self.showingTagInput ? "" : "Type here..."), text: self.$tagStringInput)
                                .background(Color.white)
                            
                            
                            Spacer()
                            
                            // save tag button
                            Button(action: {
                               // if let _:String = self.tagStringInput {
                                    //so that user sees the tag they just typed when they click tag again, uses storeTempTag
                                    // too many errors when implimented tempCopyOfTag = "ee"

                                    print("Saved")
                                    //adds, then accesses arr of IDTagsObjects,
                                    //gets it at index __. Print is used for testing
                                    TagMaker().addIDTag(id: Question().ID, tagString: self.tagStringInput)
                                   
                                    print(TagMaker().getIDTagArr(index: (TagMaker().getIDTagArrSize()) ).getTagString())
                                   
                                    self.showingTagInput.toggle()
                                //} //else{print("not saved!! ALERT ALERT TagView line 70-ish")}
                            }) {
                                Text("Save")
                                    .frame(width: 100)
                                    .padding(.vertical, 15)
                                    .background(Color("atpMagenta"))
                                    .cornerRadius(8)
                                    .foregroundColor(Color("atpSky"))
                            }
                            
                        }.sheet(isPresented: $showingTagInput){
                            QuestionView( tagStringInput: .constant(""))
                        }
                        Spacer()
                    }
                }
                
            }
        }


        struct TagView_Previews: PreviewProvider {
            static var previews: some View {
                TagView(tagStringInput: Binding.constant(String()))
            }
        }

        */
        
        
        
        
        
        
        /*
        
        
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
            //this boolean variable stores whether or not we are showing the solution.
            @State var showing : Bool = false
            //this string var stores the TextField input, which is the tag
            @Binding var tagStringInput: String
            //this boolean variable stores whether or not the TextField for tag input is showing
            @State var showingTagInput: Bool = false
            /*
             while caching strings may improve on program speed, it's not really important
             to us (yet). This means that we can use a more simple and compact solution.
             */
            
            //@State var ans = "The Solution is Hidden"
            
            var body: some View {
                
                
                /*
                 ====PROBLEM CASES THAT NEED FIGURING OUT====
                 > https://artofproblemsolving.com/wiki/index.php/2016_AMC_8_Problems/Problem_8
                 
                 https://artofproblemsolving.com/wiki/index.php/2013_AMC_8_Problems/Problem_3
                 
                 */
                
                ZStack{
                    
                    Rectangle().fill(Color("atpBlack"))
                    
                    VStack{
                        
                        //Displaying question
                        //we'll need a way to dynamically change font size so that
                        //the whole problem can fit on the screen
                        Text(question.problemText)
                            .frame(width: 300)
                            .padding(.vertical, 40)
                            //.background(Color("atpBlue"))
                            .cornerRadius(8)
                            .foregroundColor(Color("atpSky"))
                        
                        
                        question.loadFromIndex(index:0)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                            .padding()
                        
                        
                        /*
                         This chunk of code isn't a great idea because it has the precondition:
                         question.imageUrl.count > 1
                         
                         This precondition is failed for questions that don't have more than 1
                         image associated with them, for example:
                         >https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_19
                         
                         a better way to go about this would be something similar to the Contacts
                         project we did, like a ForEach loop or something.
                         ---------------------------
                         question.loadFromIndex(index:1)
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 200, height: 50)
                         */
                        
                        //Spacer()
                        
                        
                        //Show Answer
                        //in this solution to the displaying text issue, rather than hardcoding the
                        //string in the editor, we leave it up to the computer at runtime with a ternary operator.
                        Text(self.showing ? self.question.solutionText : "The Solution is Hidden")
                            .frame(width: 300)
                            .padding(.vertical, 20)
                            //.background(Color("atpBlue"))
                            .cornerRadius(8)
                            .foregroundColor(Color("atpSky"))
                        
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
                        }
                        
                        Spacer()
                        
                        //Next Question
                        Button(action: {
                            self.showing = false
                            print(self.question.solutionText)
                            self.question = Question()
                        }) {
                            Text("Next Question")
                                .frame(width: 300)
                                .padding(.vertical, 20)
                                .background(Color("atpMagenta"))
                                .cornerRadius(8)
                                .foregroundColor(Color("atpSky"))
                        }
                        
                        Spacer() //make spacer that doesnt take up so much room
                        
                        //Tag button
                        Button(action: {
                            self.showingTagInput.toggle()
                           //Too many errors when this is implemented TagView().tempCopyOfTag = "Type here..."
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
                            

                        }
                    }.sheet(isPresented: $showingTagInput){
                        TagView( tagStringInput: .constant(""))
                }
            }
        }

        struct QuestionView_Previews: PreviewProvider {
            static var previews: some View {
                QuestionView(tagStringInput: Binding.constant(String()))
            }
        }

        
        */

    }

}

struct QuestionViewWithNoTag_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewWithNoTag()
    }
}
