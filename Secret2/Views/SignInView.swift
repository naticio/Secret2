//
//  SignInView.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/14/21.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                //to show the camera icon
                Image(systemName: "camera").font(.system(size: 60, weight: .black, design: .monospaced))
                
                VStack (alignment: .leading) {
                    Text("Welcome Back").font(.system(size: 32, weight: .heavy))
                    Text("SignIn to Continue").font(.system(size: 16, weight: .medium))
                }
                
                    //email form
                    FormField(value: $email, placeholder: "E-mail", icon: "envelope.fill")
                    //password field
                    FormField(value: $password, placeholder: "Password", icon: "lock.fill", isSecure: true)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Sign In").font(.title).modifier(ButtonModifiers())
                    })
                
                HStack {
                    Text("New?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Create an account").font(.system(size: 20, weight: .semibold)).foregroundColor(.black)
                    }
                }
                
            }.padding()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
