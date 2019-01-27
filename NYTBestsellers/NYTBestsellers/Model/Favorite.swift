//
//  Favorite.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
    let bookName: String
    let favoritedAt: String
    let imageData: Data
    let description: String
    
}
