//
//  BookListModel.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

//struct BookListModel: Codable {
//    let results: [BookData]
//
//    struct BookData: Codable {
//        let weeks_on_list: Int
//        let amazon_product_url: String
//        let book_details: [Book]
//    }
//struct Book: Codable {
//    let title: String
//    let description: String
//    let author: String
//    let primary_isbn13: String
//    let primary_isbn10: String
//    }
//}
//struct BookListModelL: Codable {
//    struct DataResult: Codable {
//        let rank: Int
//        let weeksOnList: Int
//        let bookDetails: [BookDetailData]
//
//        private enum Key: String, CodingKey {
//            case weeksOnList = "weeks_on_list"
//            case bookDetails = "book_details"
//        }
//    }
//    let results: [DataResult]
//}
//struct BookDetailData: Codable {
//    let title: String
//    let description: String
//    let author: String
//}


struct CategoryModel: Codable {
    var list_name: String
}

struct CategoryList: Codable {
    var results: [CategoryModel]
}
