//
//  LaunchVC - UISetup.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension LaunchViewController {
    func setUpBackground() {
        backgroundImage = UIImageView(frame: view.frame)
        backgroundImage.image = UIImage(named: "map")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.alpha = 0.5
        view.addSubview(backgroundImage)
        
        logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 2/3))
        logoImage.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 1/2)
        logoImage.image = UIImage(named: "johnny")
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage)
    }
}
