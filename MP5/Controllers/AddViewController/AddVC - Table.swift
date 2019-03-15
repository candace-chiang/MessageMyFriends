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
        let user = events[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selected = events[indexPath.row]
        //performSegue(withIdentifier: "toDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

