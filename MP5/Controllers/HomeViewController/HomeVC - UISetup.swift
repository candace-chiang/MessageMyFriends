//
//  HomeVC - UISetup.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit


extension HomeViewController {

    func setUpNavBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriends))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .done, target: self, action: #selector(logOut))
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SourceSansPro-Regular", size: 21)!], for: .normal)
    }
    
}
