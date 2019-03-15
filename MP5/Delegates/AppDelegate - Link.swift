//
//  AppDelegate - Link.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

extension AppDelegate {
    
//    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
//        -> Bool {
//            // [END new_delegate]
//            return self.application(application,
//                                    open: url,
//                                    // [START new_options]
//                sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//                annotation: [:])
//    }
//    // [END new_options]
//    // [START old_delegate]
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url)
        if handlePasswordlessSignIn(withURL: url) {
            return true
        }
        return false
    }
    // [END old_options]
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        print(userActivity.webpageURL)
        handlePasswordlessSignIn(withURL: userActivity.webpageURL!)
        return true
    }
    

    func handlePasswordlessSignIn(withURL url: URL) -> Bool {
        let link = url.absoluteString
        // [START is_signin_link]
        if Auth.auth().isSignIn(withEmailLink: link) {
            // [END is_signin_link]
            UserDefaults.standard.set(link, forKey: "Link")
            let email = UserDefaults.standard.string(forKey: "Email")
            
//            let ref = Database.database().reference()
//            ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
//                if snapshot.hasChild(email!){
//                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nav")
//                    let navVC = vc as! UINavigationController
//                    let targetVC = navVC.viewControllers.first as! HomeViewController
//                    targetVC.user = User(firstName: firstName, lastName: lastName, userImage: chosenImage, email: userEmail, UID: id)
//                    self.window!.rootViewController! = vc
//                } else{
//                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Config")
//                    let hackyVC = vc as! ConfigViewController
//                    hackyVC.userEmail = email
//                    self.window!.rootViewController! = vc
//                }
//
//
//            })
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Config")
            let hackyVC = vc as! ConfigViewController
            hackyVC.userEmail = email
            self.window!.rootViewController! = vc
            return true
        }
        return false
    }
}
