//
//  ViewController.swift
//  MP5
//
//  Created by Sam Lee on 3/11/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit
import FirebaseAuth

class LaunchViewController: UIViewController {
    
    var backgroundImage: UIImageView!
    var logoImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
//            if Auth.auth().currentUser != nil {
//                self.performSegue(withIdentifier: "toHome", sender: self)
//            } else {
//                self.performSegue(withIdentifier: "toLogin", sender: self)
//            }
            let email = UserDefaults.standard.string(forKey: "Email")
            if email != nil {
                self.performSegue(withIdentifier: "toHome", sender: self)
            } else {
                self.performSegue(withIdentifier: "toLogin", sender: self)
            }
        }
    }


}

