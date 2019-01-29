//
//  BestSellersCell.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
        let image = UIImageView()
//        image.backgroundColor = .red
        return image
    }()
    lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var bookDescription: UITextView = {
        let description = UITextView()
        description.textColor = .black
        description.textAlignment = .center
        return description
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(bookLabel)
        addSubview(bookDescription)
        setImageConstraints()
        setNumberOfWeeksLable()
        setDescriptionConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setImageConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setNumberOfWeeksLable() {
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    func setDescriptionConstraints() {
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDescription.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bookDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bookDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookDescription.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 10).isActive = true
    }
}
