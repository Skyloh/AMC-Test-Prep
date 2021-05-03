//
//  TagMaker.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/27/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import SwiftUI
class TagMaker {
    // array of question id and the name of the tag
    var IDTagArr: [IDTagObject] = [IDTagObject(tagString: "")]
    //self.question = Question()
    var tagAlreadyExists: Bool = false
    var allTagsOfQuestion: String = ""
    
    
    func addIDTag(IdTag: IDTagObject){
        //add conditional for if tag button is pressed
        tagAlreadyExists = false
        //goes thru array of questions, adds new one each time the tag button is clicked
       
        //if theres matching quesiton id and tag name, it isnt appended
        for i in IDTagArr {
            //Question().getID()
            if (i.getID() == TempErrorWorkaround().specialGetID() && i.getTagString() == IdTag.getTagString()){
                tagAlreadyExists = true
            }
        }
        if(tagAlreadyExists == false){
            IDTagArr.append(IDTagObject(tagString: IdTag.getTagString()))
        }
                // check console for the id and tag for testing
               // print("\(i.getTagString()), \(i.getID())")
            
        
        
    }
    //delete later, its for a test
//    func exampleNumber() ->Int{
//        return 7
//    }
    //returns entire array, as array of objects
    func getWholeIDTagArr()->[IDTagObject] {
        return IDTagArr
    }
    //returns IDTagObject at an index
    func getIDTagArr(index: Int)-> IDTagObject{
        return(IDTagArr[index])
    }
    
    //for printing out list of all tags entered for the specific question before. Otherwise, user may think their tag was never saved, and doesnt know what tags there are for the question.
    func getQuestionsIDTagArr(id: Int)-> String{
        for i in IDTagArr{
            if (i.getID() == id) {
                var temp = i.getTagString()
                 allTagsOfQuestion.append(temp)
            }
        }
        return allTagsOfQuestion //IDTagArr[IDTagArr.count - 1].getTagString()
    }
    
    //returns size of array (ready to be called arr[a.getIDTagArrSize())
    func getIDTagArrSize()->Int{
        return(IDTagArr.count-1)
    }
}
struct TagMaker_Preview: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

