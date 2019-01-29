//
//  FavoriteViewCell.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol FavoriteViewCellDelegate: AnyObject{
   func detailButtonPress()
}

class FavoriteViewCell: UICollectionViewCell {
    var delegate: FavoriteViewCellDelegate?
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    lazy var descriptionText: UITextView = {
        let description = UITextView()
        description.textColor = .black
        return description
    }()
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var button: UIButton = {
        let detailBottun = UIButton()
        detailBottun.setImage(UIImage(named: "icons8-button2"), for: .normal)
        detailBottun.addTarget(self, action: #selector(detailButtonPress), for: .touchUpInside)
        detailBottun.setTitleColor(.black, for: .normal)
        return detailBottun
    }()
    @objc func detailButtonPress() {
        delegate?.detailButtonPress()
    }
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        addSubview(imageView)
        addSubview(myLabel)
        addSubview(button)
        addSubview(descriptionText)
        setImageConstraints()
        setLabelConstraints()
        setDescriptionConstraints()
        setupButtonConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setImageConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setDescriptionConstraints() {
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        descriptionText.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 10).isActive = true
    }
    func setLabelConstraints() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    func setupButtonConstraints(){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}



