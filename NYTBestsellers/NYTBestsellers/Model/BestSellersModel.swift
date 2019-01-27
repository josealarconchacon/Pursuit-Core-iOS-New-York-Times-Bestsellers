//
//  BestSellersModel.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BestSellersModel: Codable {
    struct DateResult: Codable {
        let rank: Int
        let weeksOnList: Int
        let bookDetails: [BookDetail]
        struct BookDetail: Codable {
            let title: String
            let description: String
            let author: String
        }
        private enum CodingKeys: String, CodingKey{
            case rank
            case weeksOnList = "weeks_on_list"
            case bookDetails = "book_details"
        }
    }
    let results: [DateResult]
}
