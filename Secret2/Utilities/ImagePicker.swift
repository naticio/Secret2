//
//  ImagePicker.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/14/21.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var pickedImage: Image?
    @Binding var showImagePicker: Bool
    @Binding var ImageData: Data //send along the image
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        //NSObject = parent object for everythinbg in UIKIT
        //UIimagepickercontrollerdelegate = inform us when user picks an image
        //uinavigationcontrollerdelegate
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent //tells the coordinator which one is the parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let uiImage = info[.editedImage] as! UIImage
            parent.pickedImage = Image(uiImage: uiImage)
            
            if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
                parent.ImageData = mediaData
            }
            parent.showImagePicker = false
        }
    }
}
