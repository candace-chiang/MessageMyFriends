//
//  ConfigViewController.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    var firstNameField : UITextField!
    var lastNameField : UITextField!
    var emailField : UITextField!
    var photo : UIImage!
    
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        configSetUp()

        // Do any additional setup after loading the view.
    }
    
    @objc func firstNameEntered(_ sender: UITextField) {
        name = sender.text!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
