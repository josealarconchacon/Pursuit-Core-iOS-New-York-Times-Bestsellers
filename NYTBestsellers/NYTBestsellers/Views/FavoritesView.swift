//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    let favoriteViewCell = FavoriteViewCell()
    
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.bounds.width - 40, height: (self.bounds.height) / 2)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let myCV = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCV.backgroundColor = .gray
        return myCV
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.myCollectionView.register(FavoriteViewCell.self, forCellWithReuseIdentifier: "FavoriteViewCell")
        addSubview(myCollectionView)
        setCollectionViewConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionViewConstraints() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        myCollectionView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        myCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        myCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive =  true
    }
}
