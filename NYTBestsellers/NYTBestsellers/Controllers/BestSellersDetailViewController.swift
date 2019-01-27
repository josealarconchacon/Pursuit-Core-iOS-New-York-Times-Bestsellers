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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailInfo)
    }
    init(label: String, description: String) {
    }
}
