//
//  TabBarViewController.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var mainViewController = UINavigationController.init(rootViewController: BestSellersViewController())
    var secondViewController = UINavigationController.init(rootViewController: FavoritesViewController())
    var lastViewController = UINavigationController.init(rootViewController: SettingsViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, secondViewController, lastViewController], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Best Sellers", image: nil, tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 0)
        lastViewController.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 0)
    }
}
