//
//  FormField.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/14/21.
//

import SwiftUI

//reusable COMPOENENT FOR EMAIL, PASSWORD, etc
struct FormField: View {
    @Binding var value: String
    
    var placeholder: String
    var icon: String
    var isSecure = false //less secure fields. for password
    
    var body: some View {
        Group {
            HStack {
                Image (systemName: icon).padding()
                
                Group {
                    if isSecure { //is this for the password?
                        SecureField(placeholder, text: $value) //hiddes characters, usually used for passwords
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }
                .font(Font.system(size: 20, design: .monospaced ))
                .foregroundColor(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .disableAutocorrection(true) //so we don't fuck up with password autocorrecitng?
                .autocapitalization(.none)  //so we don't autocapitalize
                
            }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 4)).padding() //??
        }
    }
}
