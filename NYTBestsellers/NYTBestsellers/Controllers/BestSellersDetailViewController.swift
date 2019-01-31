//
//  BestSellersDetailViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//


import UIKit
import SafariServices

class BestSellersDetailViewController: UIViewController,SFSafariViewControllerDelegate , ButtonInfoDelegate{
    func amazonButton() {
        urlString = amazonLink.absoluteString
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController.init(url: url, configuration: config)
            self.present(vc, animated: true)
        }
    }
    
    
    
    var favoriteVC = FavoritesViewController()
    var detailInfo = BestSellersDetailView()
    var book = [BestSellersModel.DateResult]()
    var listOfBook = DataPersistence.getBook()
    var amazonLink: URL!
    var urlString = String()
    var bookDescription = String()
    var author = String()
    var bookTitle = String()
    var primary_isbn13 = String()
    var bookImage = UIImage()
    var bookDescriptionFromGoogle = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailInfo)
        view.backgroundColor = .black
        detailInfo.delegate = self
        detailInfo.myLabel.text = bookTitle
        self.bookDescription = desciptionFromGoogle
        detailInfo.descriptionTextView.text = bookDescription
        
        
        let rightBarButton = UIBarButtonItem(title: "Favorites", style: UIBarButtonItem.Style.plain, target: self, action: #selector(apdateAlert))
        print(rightBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        APIClient.updateBookImage(Keyword: selectedisbn) { (appError, data) in
            if let appError = appError {
                self.detailInfo.detailImage.image = UIImage(named: "icons8-book")
                print(appError)
            }
            if let data = data {
                self.bookDescriptionFromGoogle = data[0].volumeInfo.description ?? ""
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
    
   @objc func apdateAlert() {
        let alert = UIAlertController(title: "Book was saved to your favorite list", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            let timetamp = Date.getISOTimestamp()
            if let image = self.detailInfo.detailImage.image{
                if let imageData = image.jpegData(compressionQuality: 0.5){
                    let favoriteToSet = FavoriteBook.init(bookName: self.bookTitle, favoritedAt: timetamp, imageData: imageData, description: self.bookDescription, amazonLink: self.amazonLink)
                     DataPersistence.saveBook(book: favoriteToSet)
                }
            }
        }
    detailInfo.buttonInfo.addTarget(self, action: #selector(amazon), for: .touchUpInside)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    @objc func amazon() {
        urlString = amazonLink.absoluteString
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController.init(url: url, configuration: config)
            self.present(vc, animated: true)
        }
    }
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!){
        print("myRightSideBarButtonItemTapped")
    }
    init(bookTitle: String, author: String, bookDescription: String, primary_isbn13: String, amazonLink: URL) {
        super.init(nibName: nil, bundle: nil)
        self.author = author
        self.bookTitle = bookTitle
        self.primary_isbn13 = primary_isbn13
        self.amazonLink = amazonLink
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
