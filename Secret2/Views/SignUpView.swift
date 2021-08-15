//
//  SignUpView.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/14/21.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var profileImage: Image? //optional in case we have not sleected it yet
    @State private var pickedImage: Image?
    @State private var showActionSheet = false //???
    @State private var showImagePicker = false //???
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary //???
    
    //functio to load the image when user comes to this screen
    func loadImage() {
        guard let inputImage = pickedImage else {
            return
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                //to show the camera icon
                Image(systemName: "camera").font(.system(size: 60, weight: .black, design: .monospaced))
                
                VStack (alignment: .leading) {
                    Text("Welcome").font(.system(size: 32, weight: .heavy))
                    Text("SignUp to Start").font(.system(size: 16, weight: .medium))
                }
                
                VStack {
                    Group {
                        if profileImage != nil {
                            profileImage!.resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showActionSheet = true
                                }
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top,20)
                                .onTapGesture {
                                    self.showActionSheet = true
        
                                }
                        }
                    }
                }
                
                Group {
                    //username
                    FormField(value: $username, placeholder: "Username", icon: "person.fill")
                    //email form
                    FormField(value: $email, placeholder: "E-mail", icon: "envelope.fill")
                    //password field
                    FormField(value: $password, placeholder: "Password", icon: "lock.fill", isSecure: true)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Sign Up").font(.title).modifier(ButtonModifiers())
                })
                
                /*
                 HStack {
                 Text("Already have an Account?")
                 Text("Sign In").font(.system(size: 20, weight: .semibold))
                 }*/
                
            }.padding()
            
            //sheet is the nice animation like popup from BELOW!!
        }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showImagePicker, ImageData: self.$imageData) //why binding? why self?
        }.actionSheet(isPresented: $showActionSheet) {
            //what is this for?
            ActionSheet(title: Text(""), buttons: [
                            .default(Text("Choose a photo")){
                                self.sourceType = .photoLibrary
                                self.showImagePicker = true
                            },
                            .default(Text("Take a Photo")){
                                self.sourceType = .photoLibrary
                                self.showImagePicker = true
                            },.cancel()])
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
