//
//  LogInViewController.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDynamicLinks

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var backgroundImage: UIImageView!
    var logoImage: UIImageView!
    var emailField : UITextField!
    var registerButton: UIButton!
    
    var email = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground()
        setUpLogin()
        DynamicLinks.performDiagnostics(completion: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.emailField.delegate = self
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
    
    @objc func emailEntered(_ sender: UITextField) {
        email = sender.text!
    }
    
    @objc func logInAttempt(_ sender: UIButton) {
        if email == "" {
            displayAlert(title: "Error", message: "Did not enter an email.")
        } else if !Utils.checkEmail(email: email) {
            displayAlert(title: "Error", message: "Check entered email.")
        } else {
            let actionCodeSettings = ActionCodeSettings()
            actionCodeSettings.url = URL(string: "http://mini-project-5.firebaseapp.com")
            actionCodeSettings.handleCodeInApp = true
            actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
            actionCodeSettings.dynamicLinkDomain = "mp5.page.link"
            Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings) { error in
                if let error = error {
                    self.displayAlert(title: "Error", message: "Unable to sign in.")
                    print("BIG FAT ERROR")
                    print(error)
                    return
                }
                print("SIGNDE IN")
                //the link was successfully sent inform function
                //save the email locally if they open the link on the same device
                UserDefaults.standard.set(self.email, forKey: "Email")
                self.displayAlert(title: "Success", message: "Check your email for the link.")
                //self.performSegue(withIdentifier: "toConfig", sender: self)
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
