//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class APIClient {
    private init() {}
    static func getCategory(completionHandler: @escaping((AppError?, CategoryList?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.CategoriesKey)") { (appError, data) in
            if let appError = appError {
                completionHandler(AppError.badURL("URL is bad"), nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(CategoryList.self, from: data)
                    completionHandler(appError, data)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
        }
    }
    static func getBook(listName: String,completionHandler: @escaping((AppError?, [BestSellersModel.DateResult]?) -> Void)) {
        let listName = listName.replacingOccurrences(of: " ", with: "-")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.CategoriesKey)&list=\(listName)") { (appError, data) in
         
            if let appError = appError {
                completionHandler(AppError.badURL("BadURL"),nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(BestSellersModel.self, from: data)
                    completionHandler(appError, data.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
        }
    }
}
