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
    
    var tableView: UITableView!
    
    var users: [User] = []
    var currUser: User!
    
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add a friend!"
        
        setUpNavbar()
        setUpTable()
        getAllUsers()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavbar()
        tableView.reloadData()
    }
    
    @objc func closeFriends(_ sender: UIBarButtonItem) {
        if let presenter = presentingViewController as? HomeViewController {
            presenter.user = currUser
        }
        dismiss(animated: true, completion: nil)
    }

}
