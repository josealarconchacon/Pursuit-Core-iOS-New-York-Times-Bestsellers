//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    var books = DataPersistence.getBook()
    let favorite = FavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(favorite)
        books = DataPersistence.getBook()
        favorite.myCollectionView.dataSource = self
    }
}
extension FavoritesViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteViewCell", for: indexPath) as? FavoriteViewCell else {return UICollectionViewCell()}
//        let bookInfo = books[indexPath.row]
//        cell.myLabel.text = bookInfo.bookName
//        cell.descriptionText.text = bookInfo.description
//        if let image = UIImage(data: bookInfo.imageData) {
//            cell.imageView.image = image
//        }
        return cell
    }
}

