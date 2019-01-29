//
//  BestSellersDetailViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//


import UIKit

class BestSellersDetailViewController: UIViewController {
    var detailInfo = BestSellersDetailView()
    var book = [BestSellersModel.DateResult]()
    var listOfBook = DataPersistence.getBook()
    var bookDescription = String()
    var author = String()
    var bookTitle = String()
    var primary_isbn13 = String()
    var bookImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailInfo)
        view.backgroundColor = .black
        detailInfo.myLabel.text = bookTitle
        detailInfo.descriptionTextView.text = bookDescription
        
        let rightBarButton = UIBarButtonItem(title: "Favorites", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.myRightSideBarButtonItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        APIClient.updateBookImage(Keyword: selectedisbn) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString, completion: { (appError, image) in
                    if let appError = appError {
                        print(appError)
                    }
                    if let image = image {
                        DispatchQueue.main.async {
                            self.detailInfo.detailImage.image = image
                            print(image)
                        }
                    }
                })
            }
        }
    }

    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!){
        print("myRightSideBarButtonItemTapped")
    }
    
    
    init(bookTitle: String,author: String,bookDescription: String,primary_isbn13: String) {
        super.init(nibName: nil, bundle: nil)
        self.author = author
        self.bookTitle = bookTitle
        self.bookDescription = bookDescription
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateDetailInfo(primary_isbn13: String) {
        
    }
}
