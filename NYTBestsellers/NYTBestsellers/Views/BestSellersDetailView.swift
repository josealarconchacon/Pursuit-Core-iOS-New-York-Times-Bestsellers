//
//  BestSellersDetailView.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersDetailView: UIView {

    lazy var detailImage: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .yellow
        return label
    }()
    lazy var detailTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .white
        textView.backgroundColor = .black
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.addSubview(detailImage)
        self.addSubview(detailTextView)
        self.addSubview(myLabel)
        backgroundColor = .white
        imageConstraints()
        setLabel()
        textViewConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func imageConstraints() {
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        detailImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        detailImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        detailImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setLabel() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 320).isActive = true
        myLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func textViewConstraints() {
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        detailTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        detailTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        detailTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
}
