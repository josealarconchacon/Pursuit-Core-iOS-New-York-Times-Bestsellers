//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController{
    var bestSellerBookViewController = BestSellersView()
    var book = [BestSellersModel.DateResult]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerBookViewController.collectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        view.addSubview(bestSellerBookViewController)
        bestSellerBookViewController.collectionView.dataSource = self
        bestSellerBookViewController.collectionView.delegate = self
        bestSellerBookViewController.pickerView.delegate = self
        bestSellerBookViewController.pickerView.dataSource = self
        
        APIClient.getCategory { (error, caregoty) in
            if let error = error {
                print(error)
            }
            if let caregoty = caregoty {
                print(error)
                print(caregoty)
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
        cell.bookLabel.text = "\(bookkToSelected.weeksOnList)"
        cell.bookDescription.text = bookkToSelected.bookDetails[0].description
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = BestSellersDetailViewController()
        navigationController?.pushViewController(detail, animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let nameToSelected = bestSellerBookViewController.names[row].list_name
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
        return bestSellerBookViewController.names[0].list_name
    }
}

 
