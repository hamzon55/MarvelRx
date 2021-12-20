//
//  TabBarViewController.swift
//  MarvelRx
//
//  Created by Hamza on 20/12/21.
//

import Foundation
import UIKit



class TabBarViewController: UITabBarController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.tabBar.layer.masksToBounds = true
         self.tabBar.barStyle = .black
         self.tabBar.barTintColor = .white
         self.tabBar.tintColor = UIColor.orange
         self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
         self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
         self.tabBar.layer.shadowRadius = 10
         self.tabBar.layer.shadowOpacity = 1
         self.tabBar.layer.masksToBounds = false

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}
