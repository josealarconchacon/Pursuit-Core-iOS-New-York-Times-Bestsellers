//
//  Favorite.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
    var bookName: String
    let favoritedAt: String
    let imageData: Data
    let description: String
    
    public var dateFormattedString: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = favoritedAt
            if let date = isoDateFormatter.date(from: favoritedAt) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM d, yyyy hh:mm a"
                formattedDate = dateFormatter.string(from: date)
            }
            return formattedDate
        }
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
            if let date = isoDateFormatter.date(from: favoritedAt){
                formattedDate = date
            }
        return formattedDate
    }
}
