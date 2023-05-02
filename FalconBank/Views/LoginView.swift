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
        NavigationStack {
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
                    NavigationLink(destination: TransactionsView()) {
                        Text("Sign in").buttonStyle(.automatic)
                    }
                }
                Spacer()
                
                ControlGroup {
                    Button("Quick View") {
                        
                    }
                    NavigationLink(destination: RecoverCreditCardPinView()) {
                        Text("Recover Pin")
                    }
                    NavigationLink(destination: BranchView(branches: mockBranches)) {
                        Text("Branches")
                    }
                }
            }
        }.background(Image("falcon").resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 7.0)
            .opacity(0.15))
        .onAppear(perform: generateCreditCards)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
