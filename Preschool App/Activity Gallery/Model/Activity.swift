//
//  Activity.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 15/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import Foundation

struct Activity {
    var id: UUID
    var title: String
    var description: String
    var imageURLs: [String]
    var dateString: String
    var date: Date
}

