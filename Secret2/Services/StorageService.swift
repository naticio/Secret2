//
//  StorageService.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/15/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage


class StorageService {
    //upload a file
    
    static var storage = Storage.storage() //static because I want to access it in a bunch of places
    
    //add link from Firebase storage
    static var storageRoot = storage.reference(forURL: "gs://secret2-f0d51.appspot.com")
    
    //create folder in the firebase storage called profile
    static var storageProfile = storageRoot.child("Profile")
    
    //save image with userid identifier? as it's unique???
    static func storageProfileId(userId: String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    static func saveProfileImage(userId:String, username:String, email:String, imageData: Data, metadata: StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void ) {
        
        storageProfileImageRef.putData(imageData, metadata: metadata) {
            (StorageMetadata, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            //update profile image if I already have an image
            storageProfileImageRef.downloadURL {
                (url, error) in
                if let metaImageUrl = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges {
                            (error) in
                            if error != nil {
                                onError(error.localizaedDescription)
                                return
                            }
                        }
                    }
                    
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, searchName: username.splitString(), bio: "")
                    
                }
            }
            
   
        }
        
    }
}
