import Foundation
import SwiftUI
import FirebaseStorage
import Firebase

// MARK: image DOWNLOAD code
class RepositoryDownload{

    var tempActivitesArray : [Activity] = []
    
    func readFromRemote(_ completion: @escaping ([Activity]) -> Void) {
         let activitesRef = Database.database().reference(withPath: "Activities")
         let dateHelper = DateHelper()
        
        activitesRef.observe(.value) { snapshot in
            if let allActivities = snapshot.value as? [String: Any] {
                
                for activity in allActivities {
                    activitesRef.child(activity.key).observe(.value) { indivdiualActivitySnapshot in
                        if let activity = indivdiualActivitySnapshot.value as? [String: Any] {
                            let description = activity["Description"] as! String
                            let title = activity["Title"] as! String
                            let imageURLs = activity["Images"] as! [String]
                            let dateString = activity["date"] as! String
                            let date = dateHelper.convertToDate(stringDate: dateString)
                            
                            self.tempActivitesArray.append(Activity(id: UUID(), title: title, description: description, imageURLs: imageURLs, dateString: dateString, date: date))
                            
                            if allActivities.count == self.tempActivitesArray.count {
                                completion(self.tempActivitesArray)
                            }
                        }
                    }
                }
            }
        }
    }
}

