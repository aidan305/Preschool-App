//
//  User.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 18/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import Foundation

struct User {
    var uid: String
    var email: String?
    var newUser: Bool?
    var parentName: String?
    
    init(uid: String, email: String?, newUser: Bool, parent: String?) {
        self.uid = uid
        self.email = email
        self.newUser = newUser
        self.parentName = parent
    }
}

