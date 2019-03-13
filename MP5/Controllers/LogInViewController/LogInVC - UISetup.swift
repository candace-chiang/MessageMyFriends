//
//  LogInVC - UISetup.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension LogInViewController {
    
    func setUpBackground() {
        backgroundImage = UIImageView(frame: view.frame)
        backgroundImage.image = UIImage(named: "map2")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.alpha = 0.5
        view.addSubview(backgroundImage)
        
        logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        logoImage.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 2/5)
        logoImage.image = UIImage(named: "johnny")
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage)
    }
    
    func setUpLogin() {
        emailField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 2/3, height: view.frame.height/15))
        emailField.center = CGPoint(x: view.frame.width/2, y: logoImage.frame.maxY + view.frame.height/8)
        emailField.adjustsFontSizeToFitWidth = true
        emailField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        emailField.textAlignment = .center
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.layer.cornerRadius = 5.0
        emailField.addTarget(self, action: #selector(emailEntered), for: .allEditingEvents)
        view.addSubview(emailField)
        
        registerButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 2/5, height: view.frame.height/15))
        registerButton.center = CGPoint(x: view.frame.width/2, y: emailField.frame.maxY + view.frame.height/15)
        registerButton.setTitle("Log in!", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.titleLabel!.font = UIFont(name: "SourceCodePro-Bold", size: 20)
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.backgroundColor = UIColor(hexString: "#FF8000").cgColor
        registerButton.layer.cornerRadius = 5.0
        registerButton.addTarget(self, action: #selector(logInAttempt), for: .touchUpInside)
        view.addSubview(registerButton)
    }
}
