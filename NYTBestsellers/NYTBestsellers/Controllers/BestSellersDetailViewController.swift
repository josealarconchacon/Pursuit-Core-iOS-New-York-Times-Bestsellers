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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailInfo)
        view.backgroundColor = .black
    }
    
    func setAlert() {
        let alert = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .default) { (UIAlertAction) in
            print("Delete")
        }
        alert.addAction(delete)
        let alert1 = UIAlertController(title: nil, message: "See on Amazon", preferredStyle: .actionSheet)
        
    }
    func deleteItem() {
        listOfBook = DataPersistence.getBook()
    }
}
