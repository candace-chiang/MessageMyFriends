//
//  AddViewController.swift
//  MP5
//
//  Created by Candace Chiang on 3/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddViewController: UIViewController {
    
    var users: [User] = []
    var currUser: User!
    var friends: [User]!
    var selected: User!
    
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
