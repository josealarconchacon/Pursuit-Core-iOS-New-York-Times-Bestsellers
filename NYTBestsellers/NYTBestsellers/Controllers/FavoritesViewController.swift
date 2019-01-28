//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    var favoriteBooks = DataPersistence.getBook()
    let favorite = FavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(favorite)
        favoriteBooks = DataPersistence.getBook()
        favorite.myCollectionView.dataSource = self
    }
}
extension FavoritesViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteViewCell", for: indexPath) as? FavoriteViewCell else {return UICollectionViewCell()}
        let book = favoriteBooks[indexPath.row]
        cell.myLabel.text = book.bookName
        cell.descriptionText.text = book.description
        return cell
    }
}

