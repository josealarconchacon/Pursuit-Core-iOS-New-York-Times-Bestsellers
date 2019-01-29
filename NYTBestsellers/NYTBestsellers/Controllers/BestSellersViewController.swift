//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

var selectedisbn = String()
var serDescription = String()
var desciptionFromGoogle = String()

class BestSellersViewController: UIViewController{
    var bestSellerBookViewController = BestSellersView()
    var placeHolder = UIImage()
    var book = [BestSellersModel.DateResult]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerBookViewController.collectionView.reloadData()
            }
        }
    }

    var categoryList = CategoryList.self
    var categoryList2 = [CategoryModel].self
    var listNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(bestSellerBookViewController)
        bestSellerBookViewController.collectionView.dataSource = self
        bestSellerBookViewController.collectionView.delegate = self
        bestSellerBookViewController.pickerView.delegate = self
        bestSellerBookViewController.pickerView.dataSource = self
        bestSellerBookViewController.collectionView.reloadData()
        updateListName()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let names = UserDefaults.standard.object(forKey: "Name") as? String{
            APIClient.getBook(listName: names) { (appError , bookData) in
                if let appError = appError {
                    print(appError)
                }
                if let bookData = bookData {
                    self.book = bookData
                    print(self.book.count)
                }
            }
        } else {
            APIClient.getBook(listName: "Hardcover-Fiction") { (appError , bookData) in
                if let appError = appError {
                    print(appError)
                }
                if let bookData = bookData {
                    self.book = bookData
                    print(self.book.count)
                }
            }
        }
    }
    func updateListName() {
        APIClient.getCategory { (error, category) in
            if let error = error {
                print(error)
            }
            if let category = category {
                if self.listNames.count == 0 {
                    for result in category.results {
                        self.listNames.append(result.list_name)
                    }
                }
                print(self.listNames)
            }
        }
        APIClient.getBook(listName: "Hardcover-Fiction") { (appError , bookData) in
            if let appError = appError {
                print(appError)
            }
            if let bookData = bookData {
                self.book = bookData
                print(self.book.count)
            }
        }
    }
}

extension BestSellersViewController: UICollectionViewDataSource, UIPickerViewDataSource,UIPickerViewDelegate, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellersCell", for: indexPath) as? BestSellersCell else {return UICollectionViewCell()}
        let bookkToSelected = book[indexPath.row]
        cell.bookLabel.text = "\(bookkToSelected.weeksOnList) week on best seller list"
        cell.bookDescription.text = bookkToSelected.bookDetails[0].description
        
        APIClient.updateBookImage(Keyword: bookkToSelected.bookDetails[0].primary_isbn13) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                desciptionFromGoogle = data[0].volumeInfo.description

                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString, completion: { (appError, image) in
                    if let appError = appError {
                        print(appError)
                    }
                    if let image = image {
                        DispatchQueue.main.async {
                            cell.imageView.image = image
                            print(image)
                        }
                    }
                })
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookDetails = book[indexPath.row]
        let detail = BestSellersDetailViewController(bookTitle: bookDetails.bookDetails[0].title, author: bookDetails.bookDetails[0].author, bookDescription: bookDetails.bookDetails[0].description, primary_isbn13: bookDetails.bookDetails[0].primary_isbn13)
        selectedisbn = bookDetails.bookDetails[0].primary_isbn13
        detail.bookDescriptionFromGoogle = desciptionFromGoogle
        navigationController?.pushViewController(detail, animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let nameToSelected = listNames[row]
        APIClient.getBook(listName: nameToSelected) { (error, data) in
            if let error = error {
                print(error)
            }
            if let data = data {
                self.book = data
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bestSellerBookViewController.names.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bestSellerBookViewController.names[row].list_name
    }
}

 
