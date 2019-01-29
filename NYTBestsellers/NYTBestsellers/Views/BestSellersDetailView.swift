//
//  BestSellersDetailView.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol ButtonInfoDelegate: AnyObject {
    func amazonButton()
}

class BestSellersDetailView: UIView {
    weak var delegate: ButtonInfoDelegate!
    
    lazy var detailImage: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    lazy var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        return textView
    }()
    lazy var buttonInfo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-amazon"), for: .normal)
        button.addTarget(self, action: #selector(amazonButton), for: .touchUpInside)
        return button
    }()
    @objc func amazonButton() {
        delegate.amazonButton()
    }
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.addSubview(detailImage)
        self.addSubview(descriptionTextView)
        self.addSubview(myLabel)
        self.addSubview(buttonInfo)
        backgroundColor = .white
        imageConstraints()
        setLabelConstraints()
        textViewConstraints()
        setButtonConstraints()
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
    func setLabelConstraints() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 320).isActive = true
        myLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func textViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 350).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        descriptionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    func setButtonConstraints() {
        buttonInfo.translatesAutoresizingMaskIntoConstraints = false
        buttonInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        buttonInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
