//
//  RepositoryUserUpload.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 21/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import Foundation
import FirebaseStorage
import Firebase
import SwiftUI

class RepositoryUserUpload{
    
    func registerUserIntoDatabase(id: String, email: String, parentName: String, _ completion: @escaping () -> Void) {
        
            let ref = Database.database().reference()
            let userReference = ref.child("Users").child(id)
            
            let values = ["email": email , "parent" : parentName]
            
            userReference.updateChildValues(values, withCompletionBlock: { error, ref in
                if let error = error {
                    print(error)
                    return
                }
                print("upload complete to \(ref)")
                completion()
                
            })
        }
    }

