//
//  ContentView.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mail = ""
    @State private var password = ""
    
    
    var body: some View {
        VStack {
            FormField(value: $mail, placeholder: "E-mail", icon: "mail") //for email
            FormField(value: $password, placeholder: "Password", icon: "lock",isSecure: true) //for password, $ means binding
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
