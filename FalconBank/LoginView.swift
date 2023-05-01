//
//  LoginView.swift
//  FalconBank
//
//  Created by Roy Falk on 30/04/2023.
//

import SwiftUI

struct LoginView: View {
    @State var account: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            Image("falcon").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 7.0)
                .opacity(0.15)
            VStack {
                Image("falcon")
                GroupBox() {
                    HStack {
                        Text("Account")
                        TextField("Your account number", text: $account)
                    }
                    HStack {
                        Text("Password")
                        TextField("your password", text: $password, onEditingChanged: {
                            newPassword in
                            print("Password changed to \(newPassword)")
                        })
                    }
                    Button("Sign in") {
                        print("'Sign in clicked'")
                    }
                }.padding(15.0)
                Spacer()
                ControlGroup {
                    Button("Quick View") {
                        
                    }
                    
                    Button("Recover Pin") {
                        
                    }
                    
                    Button("Branches") {
                        
                    }
                }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}