//
//  DataPersistence.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct DataPersistence {
    public static let filename = "Name.plist"
    public static let fileName = "Book.plist"
    private static var favoriteBooks = [FavoriteBook]()
    private static var nanes = [CategoryModel]()
    
    static func getSaved(data: [CategoryModel]) {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
            do {
                let data = try PropertyListEncoder().encode(data)
                try  data.write(to: path, options: .atomic)
            } catch {
                print("property list encoding error : \(error)")
        }
    }
    static func getNames() -> [CategoryModel]{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    nanes = try PropertyListDecoder().decode([CategoryModel].self, from: data)
                } catch {
                    print("decoding: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) is nil")
            }
            return nanes
        }
    static func saveBook(book: FavoriteBook) {
        favoriteBooks.append(book)
        saveToFavorites()
    }
    static func deleteBook(index: Int) {
        favoriteBooks.remove(at: index)
        saveToFavorites()
    }
    static func getBook() -> [FavoriteBook] {
         let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteBooks = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
                } catch {
                    print("Decoding error: \(error)")
                }
            } else {
                print("Data is nil")
            }
        }else {
            print("\(fileName) is nil")
        }
        return favoriteBooks
    }
    static func saveToFavorites() {
         let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Encoding error is: \(error)")
        }
    }
}

