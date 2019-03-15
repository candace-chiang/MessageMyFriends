//
//  AddVC - Table.swift
//  MP5
//
//  Created by Candace Chiang on 3/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension AddViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! AddTableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        let size = CGSize(width: tableView.frame.width, height: view.frame.height/8)
        cell.initCellFrom(size: size)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tableCell = cell as! AddTableViewCell
        let user = users[indexPath.row]
        
        tableCell.profileImage.image = user.userImage
        tableCell.nameLabel.text = user.firstName + " " + user.lastName
        if currUser.id == user.id{
            tableCell.addFriend.text = "  Me"
            tableCell.addFriend.backgroundColor = UIColor(hexString: "#FAAC58")
        } else if Array(currUser.userFriends.keys).contains(user.id) {
            tableCell.addFriend.text = "  Friend"
            tableCell.addFriend.backgroundColor = UIColor(hexString: "#A9F5BC")
        } else {
            tableCell.addFriend.text = "  Add as friend!"
            tableCell.addFriend.backgroundColor = UIColor(hexString: "#D8D8D8")
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let user = users[indexPath.row]
        if currUser.id == user.id ||  Array(currUser.userFriends.keys).contains(user.id) {
            return nil
        } else {
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = users[indexPath.row]
        addFriend(friend: friend)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

