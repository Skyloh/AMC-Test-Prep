//
//  UserInfo.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/7/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import FirebaseAuth

/*

   ---UNUSED---

   Due to time constraints and difficulty, Firebase was not functional.
   Therefore, active elements were removed in order to increase build speed

*/

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
