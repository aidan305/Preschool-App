//
//  Activity.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 05/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import Foundation
import SwiftUI
class ActivitesStore: ObservableObject {
    
    @Published var activites : [Activity] = []
    let repo = RepositoryDownload()
    
    init() {
        repo.readFromRemote { (activitiesFromRemote) in
            self.activites = activitiesFromRemote.sorted { $0.date > $1.date}
            
        }
        
    }
}





