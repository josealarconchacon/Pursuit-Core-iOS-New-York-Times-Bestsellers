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
        favorite.myCollectionView.reloadData()
    }
    @objc func setButton(sender: UIButton) {
        let index = sender.tag
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .default) { (UIAlertAction) in
            DataPersistence.deleteBook(index: index)
            self.favorite.myCollectionView.reloadData()
        }
    }
}
extension FavoritesViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteViewCell", for: indexPath) as? FavoriteViewCell else {return UICollectionViewCell()}
       // let addToFavorite = favoriteBooks[indexPath.row]
        return cell
    }
}
