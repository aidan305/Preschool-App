//
//  DateHelpers.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 27/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import Foundation

class DateHelper {
    func convertToDate(stringDate: String) -> Date {
        var dateToreturn = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        if let date = dateFormatter.date(from: stringDate){
            dateToreturn = date
        }
        return dateToreturn
    }
}

