//
//  AddVC - UISetup.swift
//  MP5
//
//  Created by Candace Chiang on 3/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension AddViewController {
    func setUpNavbar() {
        self.navigationController!.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(closeFriends))
    }
    
    func setUpTable() {
        tableView = UITableView(frame: view.frame)
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = view.frame.height/8
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.frame.height/8, right: 0)
        view.addSubview(tableView)
    }
}
