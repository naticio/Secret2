//
//  ButtonModifiers.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/14/21.
//

import SwiftUI

//is this moifier to change the buttoin appearance?
struct ButtonModifiers: ViewModifier { //what is a view modifier?
  
    func body(content: Content) -> some View {
        content
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold)).background(Color.black)
            .cornerRadius(5.0)
        
       
    }
}

