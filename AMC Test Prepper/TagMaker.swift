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
    var IDTagArr: [IDTagObject] = [IDTagObject(id: 1, tagString: "")]
    //self.question = Question()
    
    func addIDTag(id: Int, tagString: String){
        //add conditional for if tag button is pressed
        
        //goes thru array of questions, adds new one each time the tag button is clicked
        //if theres matching quesiton id and tag name, it isnt appended
        for i in IDTagArr {
            if !(i.getID() == id && i.getTagString() == tagString){
                IDTagArr.append(IDTagObject(id: id, tagString: tagString))
                // check console for the id and tag for testing
                print("\(i.getTagString()), \(i.getID())")
            }
        }
        
    }
}
struct TagMaker_Preview: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

