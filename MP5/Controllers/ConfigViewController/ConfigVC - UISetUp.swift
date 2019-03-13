//
//  ConfigVC - UISetUp.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension ConfigViewController {
    
    func setUpImagePicker() {
        imagePicker = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/4))
        imagePicker.center = CGPoint(x: view.frame.width/2, y: view.frame.height/7)
        imagePicker.setImage(UIImage(named: "profilepicdefault"), for: .normal)
        imagePicker.imageView?.contentMode = .scaleAspectFit
        imagePicker.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        view.addSubview(imagePicker)
        
        imageView = UIImageView(frame: CGRect(x: view.frame.width * 0.52, y: imagePicker.frame.maxY , width: view.frame.width/8, height: view.frame.width/8))
        imageView.image = UIImage(named: "click")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    func configSetUp() {
        let width = view.frame.width * 3/4
        let height = view.frame.height/15
        let offset = view.frame.height/30
        
        firstNameField = UITextField(frame: CGRect(x: 0, y: 0, width: width, height: height))
        firstNameField.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 1/2)
        makeField(firstNameField)
        firstNameField.placeholder = "First name"
        firstNameField.addTarget(self, action: #selector(firstNameEntered), for: .allEditingEvents)
        view.addSubview(firstNameField)
        
        lastNameField = UITextField(frame: CGRect(x: 0, y: 0, width: width, height: height))
        lastNameField.center = CGPoint(x: view.frame.width/2, y: firstNameField.frame.maxY + offset)
        makeField(lastNameField)
        lastNameField.placeholder = "Last name"
        lastNameField.addTarget(self, action: #selector(lastNameEntered), for: .allEditingEvents)
        view.addSubview(lastNameField)
        
        
    }
    
    func makeField(_ field: UITextField) {
        field.adjustsFontSizeToFitWidth = true
        field.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        field.textAlignment = .center
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 5.0
    }
    
    
}
