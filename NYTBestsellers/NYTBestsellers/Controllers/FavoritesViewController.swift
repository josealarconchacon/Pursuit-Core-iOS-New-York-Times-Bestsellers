//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import SafariServices



class FavoritesViewController: UIViewController,UIActionSheetDelegate, SFSafariViewControllerDelegate {

    var favoriteBooks = DataPersistence.getBook()
    var savedBook = DataPersistence.saveToFavorites()
    let favorite = FavoritesView()
    let favorites = FavoriteViewCell()
    var bookImage = String()
    
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(favorite)
        savedBook = DataPersistence.saveToFavorites()
        favorite.myCollectionView.dataSource = self
        favorite.myCollectionView.reloadData()
        updateUI()
        reload()
        delete()
    }
    
    func updateUI() {
        APIClient.updateBookImage(Keyword: selectedisbn) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                self.bookImage = data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString, completion: { (appError, image) in
                    if let appError = appError {
                        print(appError)
                    }
                    if let image = image {
                        DispatchQueue.main.async {
                            self.favorites.imageView.image = image
                        }
                    }
                })
            }
        }
    }
    @objc func setButton(sender: UIButton) {
        let index = sender.tag
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .default) { (UIAlertAction) in
            DataPersistence.deleteBook(index: index)
            self.favorite.myCollectionView.reloadData()
            self.reload()
            self.delete()
        }
        action.addAction(delete)
        let seeOnAmazon = UIAlertAction(title: "See on Amazon", style: .default) { (UIAlertAction) in
            let amazonURL = self.favoriteBooks[index].amazonLink
//            UIApplication.shared.open(amazonURL)
            let configuration = SFSafariViewController.Configuration()
            configuration.entersReaderIfAvailable = true
            let fvc = SFSafariViewController(url: amazonURL, configuration: configuration)
            self.favorite.myCollectionView.reloadData()
            
//            self.present(action, animated: true, completion: nil)
                    self.present(fvc, animated: true)
        }
        action.addAction(seeOnAmazon)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        action.addAction(cancelAction)
        present(action, animated: true, completion: nil)
    }
    func reload() {
        favoriteBooks = DataPersistence.getBook()
        self.favorite.myCollectionView.reloadData()
    }
    func delete() {
        favoriteBooks = DataPersistence.getBook()
        self.favorite.myCollectionView.reloadData()
    }
}
extension FavoritesViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteViewCell", for: indexPath) as? FavoriteViewCell
        let addToFavorite = favoriteBooks[indexPath.row]
        cell?.myLabel.text = addToFavorite.bookName
        cell?.descriptionText.text = addToFavorite.description
        cell?.button.tag = indexPath.row
        cell!.layer.cornerRadius = 30
        cell!.layer.masksToBounds = true
        cell?.button.addTarget(self, action: #selector(setButton), for: .touchUpInside)
        if let image = UIImage(data: addToFavorite.imageData){
            cell?.imageView.image = image
        }
        return cell!
    }
    
}

