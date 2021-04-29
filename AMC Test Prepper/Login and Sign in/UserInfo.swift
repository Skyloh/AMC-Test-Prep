//
//  UserInfo.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/7/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import FirebaseAuth


class UserInfo: ObservableObject{
    enum FBAuthSafe{
        case undefined, signedOut, signedIn
    }
    @Published var isUserAuthenticated : FBAuthSafe = .undefined
    func configureFirebaseStateDidChange(){
        if let _ = Auth.auth().currentUser{
            self.isUserAuthenticated = .signedIn
        }
        else{
            self.isUserAuthenticated = .signedOut
        }
    }
}

// add stuff to this. Basic idea is button on screen that adds tags by input string, shows in data paired with
//id in a 2d array. Figure out what this does exactly, and how to add vars / use database stuff.
//append using the Question.swift fun addTag
// Basically, make array of Tag&ID, declare somewhere. Next, get the data with each click, and then set up a new
// screen to come up (or just have place to enter text). Finally, figure out parsing data stuff. It will take
// the longest amount of time
//Make tab view after
// use same stuff as the login thing that inputs username
// make a call to the TagView class each time a new id is made
