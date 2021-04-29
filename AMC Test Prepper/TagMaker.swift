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
    
    var tagArr: [IDTagObject] = []
    var wwee: IDTagObject = IDTagObject(id:3,tagString: "E")
    // just do question.ID to add stuff to array
    //self.question = Question()
    
    func addTag(id: Int){
        //add conditional for if tag button is pressed
        if !tagArr.contains(id) {
            tagArr.append(id)
        }
        
        
    }
}
struct TagMaker_Preview: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

