//
//  AddTableViewCell.swift
//  MP5
//
//  Created by Candace Chiang on 3/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class AddTableViewCell: UITableViewCell {
    
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var addFriend: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width/4, height: size.height * 3/4))
        profileImage.center = CGPoint(x: size.width/4, y: size.height/2)
        profileImage.contentMode = .scaleAspectFit
        contentView.addSubview(profileImage)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width/2, height: size.height/2))
        nameLabel.center = CGPoint(x: size.width * 2/3, y: size.height/3)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont(name: "SourceSansPro-Bold", size: 20)
        contentView.addSubview(nameLabel)
        
        addFriend = UILabel(frame: CGRect(x: 0, y: 0, width: size.width/3, height: size.height/3))
        addFriend.center = CGPoint(x: nameLabel.frame.midX, y: size.height * 2/3)
        addFriend.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        addFriend.layer.masksToBounds = true
        addFriend.layer.cornerRadius = 8
        contentView.addSubview(addFriend)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
