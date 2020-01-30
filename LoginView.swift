//
//  LoginView.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 22.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import SwiftUI


struct LoginView : View {
    @State private var email = ""
    @State private var password = ""
    @State private var login = ""
    
    let getEmail = "app-designer2@gmail.com"
    let getPassword = "designer2"
    
    @State  var authenticaEnable: Bool = false
    @State  var authenticaDesable: Bool = false
    var body: some View {
        VStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color.orange , lineWidth: 2))
                
                if authenticaEnable {
                    Text("Welcome!")
                        .font(.headline)
                        .frame(width: 280, height: 60)
                        .background(Color.orange)
                        .cornerRadius(6.0)
                        .foregroundColor(.white)
                        .animation(.basic(duration: 1, curve: .easeIn))
                }
                
                VStack(alignment: .leading) {
                    Text("Email").color(.secondary)
                    Group {
                        TextField($email,placeholder: Text("@Example")).padding(12)
                    }.background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 2)
                    
                    Text("Password").color(.secondary)
                    Group {
                        SecureField($password,placeholder: Text("********")).padding(12)
                    }.background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 2)
                }.padding(.leading,11)
                
                if authenticaDesable {
                    Text("password or email incorrect :(")
                        .offset(y: -9)
                        .foregroundColor(.red)
                }
                
                
                Button(action: {
                    if self.email == self.getEmail && self.password == self.getPassword {
                        
                        self.authenticaEnable = true
                        self.authenticaDesable = false
                        self.email = ""
                        self.password = ""
                        
                    } else {
                        self.authenticaDesable = true
                        LoadingView()
                    }
                }) {
                    Group {
                        Text("Login").color(.white).frame(width: 240, height:  45)
                    }.background((email.count + password.count > 0) ?
                        Color.orange :
                        Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 2)
                }
                Button(action: {}) {
                    Text("Sign Up").padding(10)
                    .foregroundColor(.white)
                }.background(Color.blue)
                    .frame(width: 100, height: 30)
                .cornerRadius(8)

            }.padding(12)
        }
    }
}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
