//
//  GoogleImage.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleImage: Codable{
    let items: [ItemsWrapper]
    
    struct ItemsWrapper: Codable {
        let volumeInfo: VolumeInfo
    }
    struct VolumeInfo: Codable {
        let description: String?
        let imageLinks: ImageData
    }
    struct ImageData: Codable {
        let smallThumbnail: URL
        let thumbnail: URL
    }
}

