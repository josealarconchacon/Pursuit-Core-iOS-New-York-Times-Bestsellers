//
//  BestSellersView.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersView: UIView {
    let names = DataPersistence.getNames()
    var bestSelletShow = [BestSellersModel.DateResult]() {
        didSet {
            DispatchQueue.main.async {
               self.collectionView.reloadData()
            }
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 240, height: 280)
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        let myCV = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCV.backgroundColor = .white
        return myCV
    }()
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .gray
        collectionView.register(BestSellersCell.self, forCellWithReuseIdentifier: "BestSellersCell")
        addSubview(collectionView)
        addSubview(pickerView)
        //addSubview(pickerViewLabel)
        setCollectionViewConstraints()
        setPickerViewConstraints()

        APIClient.getBook(listName: "") { (appError, bookData) in
            if let appError = appError {
                print("App error is : \(appError)")
            }
            if let bookData = bookData {
                self.bestSelletShow = bookData
//                print(bookData)
            }
        }
   }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: heightAnchor, constant: -600).isActive = true
    }
    func setPickerViewConstraints() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 325).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        pickerView.heightAnchor.constraint(equalTo: heightAnchor, constant: -500).isActive = true
    }
}
