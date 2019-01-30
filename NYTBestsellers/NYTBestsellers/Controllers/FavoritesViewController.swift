//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController,UIActionSheetDelegate {
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
        action.addAction(delete)
        let seeOnAmazon = UIAlertAction(title: "See on Amazon", style: .default) { (UIAlertAction) in
            guard let web = URL(string: "https://www.amazon.com/Educated-Memoir-Tara-Westover/dp/0399590501?tag=NYTBS-20") else { return }
            UIApplication.shared.open(web)
            self.favorite.myCollectionView.reloadData()
            self.present(action, animated: true, completion: nil)
        }
        action.addAction(seeOnAmazon)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        action.addAction(cancelAction)
        //        self.present(action, animated: true, completion: nil)
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

