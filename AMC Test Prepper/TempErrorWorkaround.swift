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
    var specialID: Int = 0
    
    
    //workaround for looping generation of new question urls whenever a call to questionView is made,
    // cuz a couple things need the ID, and end up messing with initalizers while user is inside of TagView.
    func setID(id: Int){
         specialID = id
    }
    
    func specialGetID()-> Int{
        return specialID
    }
}
