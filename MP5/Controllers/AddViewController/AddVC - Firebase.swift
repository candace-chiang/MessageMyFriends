//
//  AddVC - Firebase.swift
//  MP5
//
//  Created by Candace Chiang on 3/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

extension AddViewController {
    func getAllUsers() {
        let eventsRef = Database.database().reference().child("users")
        let imagesRef = Storage.storage().reference().child("images")
        
        eventsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let allUsers = snapshot.value as? [String : Any] ?? [:]
            var newUsers: [User] = []
            
            for (key, value) in allUsers {
                let newUser = User(UID: key, user: value as! [String : Any])
                let image = imagesRef.child(key)
                image.getData(maxSize: 30 * 1024 * 1024) { data, error in
                    if let error = error {
                        newUser.userImage = UIImage(named: "profilepicdefault")
                    } else {
                        newUser.userImage = UIImage(data: data!)
                    }
                }
                newUsers.append(newUser)
            }
            self.users = newUsers
            self.tableView.reloadData()
        })
    }
}
