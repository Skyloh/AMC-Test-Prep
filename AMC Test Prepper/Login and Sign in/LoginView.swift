//
//  LoginView.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/7/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI

struct LoginView: View {
    enum Action{
        case signUp, resetPW
    }
    
    @State var showSheet = false
    @State var action : Action?
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        SignInWithEmailView(showSheet: $showSheet, action: $action).sheet(isPresented: $showSheet) {
            if self.action == .signUp{
                SignUpView().environmentObject(self.userInfo)
            }else{
                ForgotPasswordView()
            }
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
