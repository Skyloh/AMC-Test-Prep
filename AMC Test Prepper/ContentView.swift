//
//  ContentView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 3/11/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
import WebKit


//https://www.hackingwithswift.com/quick-start/swiftui/how-to-lazy-load-views-using-lazyvstack-and-lazyhstack
//delete this aaaaaaaa***


struct ContentView: View {
    @EnvironmentObject var userInfo : UserInfo

    var body: some View {
//        Group{
//            if userInfo.isUserAuthenticated == .undefined{
//                Text("Loading")
//            }
//            else if userInfo.isUserAuthenticated == .signedOut{
//                LoginView()
//            }
//            else{
//                loginHomeView()
//            }
//        }.onAppear{
//            self.userInfo.configureFirebaseStateDidChange()
//        }
        
        
        ZStack{
            homeView()
            
            
         }
        
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
