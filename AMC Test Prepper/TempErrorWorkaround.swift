//
//  TempErrorWorkaround.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 5/2/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import UIKit


class TempErrorWorkaround{
    public var specialID: Int = 123
    var specialID2: Int = 234
//    var temporary: Bool
//    var temp: Int
//    init(){
//        if let _: Int = specialID{
//            temporary = false
//            temp = specialID
//            specialID = temp
//            }
//        else{
//            temporary = true
//            specialID = Question().getID()
//        }
//    }
    //workaround for looping generation of new question urls whenever a call to questionView is made,
    // cuz a couple things need the ID, and end up messing with initalizers while user is inside of TagView.
    func setID(id: Int){
         specialID = id
    }
    
    func specialGetID()-> Int{
        return specialID
    }
}
