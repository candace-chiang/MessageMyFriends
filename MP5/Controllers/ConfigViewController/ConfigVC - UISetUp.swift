//
//  ConfigVC - UISetUp.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension ConfigViewController {
    
    func configSetUp() {
        firstNameField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3 / 4, height: 50))
        firstNameField.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 1/2)
        firstNameField.adjustsFontSizeToFitWidth = true
        firstNameField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        firstNameField.textAlignment = .center
        firstNameField.placeholder = "First name"
        firstNameField.borderStyle = .roundedRect
        firstNameField.layer.cornerRadius = 5.0
        firstNameField.addTarget(self, action: #selector(firstNameEntered), for: .allEditingEvents)
        view.addSubview(firstNameField)
        
        
    }
    
    
}
