//
//  AuthService.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/15/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

//SERVICE TO HANDLE IMAGES in chat, in proof file, in the timeline

class AuthService {
    
    static var storeRoot = Firestore.firestore()
    
    static func getUserId(userId: String) -> DocumentReference {
        //to retrieve the firestore collection. a collection is like a table in a db
        return storeRoot.collection("users").document("userId") //user collection and bring userId as key identifier
    }
    
    static func signUp(username: String, email: String, password: String, imageData: Data, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {
        (authData, error) in
        
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else {return}
            
            let storageProfileUserId = StorageService.storageProfileId(userId: userId) //we use the useer id to name the orofile avatar
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            StorageService.saveProfileImage(userId: userId, username: username, email: email, imageData: imageData, metadata: metadata, storageProfileImageRef: storageProfileUserId, onSuccess: onSuccess, onError: onError)
    }
}
}

