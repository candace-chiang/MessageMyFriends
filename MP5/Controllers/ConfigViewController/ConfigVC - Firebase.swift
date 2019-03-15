//
//  ConfigVC - Firebase.swift
//  MP5
//
//  Created by Candace Chiang on 3/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

extension ConfigViewController {
    @objc func setUpClicked(_ sender: UIButton) {
        if firstName == "" {
            displayAlert(title: "Error", message: "Did not enter a first name.")
        } else if lastName == ""{
            displayAlert(title: "Error", message: "Did not enter a last name.")
        } else if chosenImage == nil {
            displayAlert(title: "Error", message: "Did not choose an image.")
        }  else {
            setUpButton.isUserInteractionEnabled = false
            let ref = Database.database().reference()
            
            let id = ref.childByAutoId().key
            self.id = id
            
            var user: [String: Any] = [:]
            var friends: [String: Bool] = [:]
            user["firstName"] = self.firstName
            user["lastName"] = self.lastName
            user["email"] = self.userEmail
            user["userFriends"] = friends
            
            ref.child("users").child(id!).setValue(user)
            
            let imageRef = Storage.storage().reference().child("images").child(id!)
            let data = chosenImage.pngData()!
            print("PUTTING DATA")
            imageRef.putData(data, metadata: nil) { (metadata, error) in
                if metadata == nil {
                    print("ERROR NO METADATA")
                    print(error)
                    return
                }
                print("data put")
                imageRef.downloadURL { (url, error) in
                    if url == nil {
                        print("URL NO DATA")
                        return
                    }
                    print("downloaded")
                    self.performSegue(withIdentifier: "toHome", sender: self)
                }
            }
        }
    }
}
