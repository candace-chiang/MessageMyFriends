//
//  AppDelegate - Link.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import Foundation
import FirebaseAuth

extension AppDelegate {
    func handlePasswordlessSignIn(withURL url: URL) -> Bool {
        let link = url.absoluteString
        // [START is_signin_link]
        if Auth.auth().isSignIn(withEmailLink: link) {
            // [END is_signin_link]
            UserDefaults.standard.set(link, forKey: "Link")
            (window?.rootViewController as? UINavigationController)?.popToRootViewController(animated: false)
            window?.rootViewController?.children[0].performSegue(withIdentifier: "toConfig", sender: nil)
            return true
        }
        return false
    }
}
