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
        let usersRef = Database.database().reference().child("users")
        let imagesRef = Storage.storage().reference().child("images")
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
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
    
    func addFriend(friend: User) {
        let currRef = ref.child("users").child(currUser.id)
        currRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            guard let value = snapshot.value as? NSDictionary else {
                return
            }
            
            var userFriends = value["userFriends"] as? [String: Bool] ?? [:]
            userFriends[friend.id] = false
            self.currUser.friends[friend] = false
            
            currRef.updateChildValues(["userFriends": userFriends], withCompletionBlock: { (error, ref) in
                if error != nil {
                    return
                } else {
                    if let presenter = self.presentingViewController as? HomeViewController {
                        presenter.user = self.currUser
                    }
                    self.dismiss(animated: true, completion: nil)
                }
            })
            
            
        })
    }
}
