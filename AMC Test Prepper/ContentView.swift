//
//  ContentView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 3/11/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //this contentView is different than Alex's, needs to be combined
    var body: some View {
        Group{
            if user.info.isUserAuthenticated == udefined{
                Text("loading")
            }
            else if userInfo.isUserAuthenticated == .signedOut{
                LoginView()
            }
            else{
                HomeView()
            }
        }.onAppear{
            self.userInfo.configureFirebaseStateDidChange()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
