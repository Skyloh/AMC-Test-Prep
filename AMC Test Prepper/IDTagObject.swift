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
    var _ID: Int = 0
    var _TagString: String = ""
    
    init (id: Int, tagString: String) {
        self._ID = id
        self._TagString = tagString
    }
    
    func get_ID()-> Int{
        return _ID
    }
    func get_TagString()-> String{
        return _TagString
    }
//    func set_ID( id: Int){
//        _ID = id
//    }
//    func set_TagString( tagString: String){
//        _TagString = tagString
//    }
    
}
