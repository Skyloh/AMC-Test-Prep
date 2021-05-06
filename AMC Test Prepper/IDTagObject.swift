//
//  IDTagObject.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/29/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import UIKit
//used to store tags and their strings in a 2D array (is called in TagMaker class)

//rename comment if I renamed TagMaker
class IDTagObject{
    var _ID: Int
    var _TagString: String
    
    init ( tagString: String, ID: Int) {
        self._TagString = tagString
        self._ID = ID
    }
    
    func getID()-> Int{
        return _ID
    }
    func getTagString()-> String{
        return _TagString
    }
    

    
}
