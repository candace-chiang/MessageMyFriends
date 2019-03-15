//
//  HomeViewController.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    
    var user: User!
    
    //var userFirstName: String!
    //var userLastName: String!
    

    var userImageView: UIImageView!
    
    var locationManager: CLLocationManager!
    
    var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = user.firstName + " " + user.lastName
        createMapView()
        setUpNavBar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create and Add MapView to our main view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        determineCurrentLocation()
    }
    
    @objc func addFriends(_ sender: UIBarButtonItem) {
        present(UINavigationController(rootViewController: AddViewController()), animated: true, completion: nil)
    }
    
    @objc func logOut(_ sender: UIBarButtonItem) {
//        do {
//            try Auth.auth().signOut()
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }
        
        guard(navigationController?.popToRootViewController(animated: true))
            != nil
            else{
                print("You are signed out")
                return
        }
    }
}
