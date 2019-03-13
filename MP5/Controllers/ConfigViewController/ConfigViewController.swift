//
//  ConfigViewController.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController, UITextFieldDelegate {
    
    var imageView: UIImageView!
    var imagePicker: UIButton!
    var firstNameField : UITextField!
    var lastNameField : UITextField!
    
    var chosenImage: UIImage!
    
    var firstName = ""
    var lastName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImagePicker()
        configSetUp()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstNameField.delegate = self
        lastNameField.delegate = self
    }
    
    //dismiss keyboard when you press somewhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //dismiss keyboard when you press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func firstNameEntered(_ sender: UITextField) {
        firstName = sender.text!
    }
    
    @objc func lastNameEntered(_ sender: UITextField) {
        lastName = sender.text!
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
