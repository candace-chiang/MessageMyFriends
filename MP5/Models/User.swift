//
//  User.swift
//  MP5
//
//  Created by Candace Chiang on 3/13/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import Foundation
import MapKit

class User: NSObject {
    var id: String!
    var firstName: String!
    var lastName: String!
    var userEmail: String!
    var userFriends: [User: Bool]!
    var userImage: UIImage!
//    var userLastLocationUpdate: String!
    
//    var title: String!
//    var subtitle: String!
//    var coordinate: CLLocationCoordinate2D
    
//    init(firstName: String, lastName: String, userImage: UIImage, email: String, lat: Float, lon: Float, UID: String!) {
//        self.id = UUID().uuidString
//        self.firstName = firstName
//        self.lastName = lastName
//        self.userImage = userImage
//        self.userEmail = email
//        self.userFriends = []
//        self.userLastLocationUpdate = ""
//
//        self.title = firstName
//        self.subtitle = userLastLocationUpdate
//        self.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: lat)!, longitude: CLLocationDegrees(exactly: lon)!)
//    }
    
    init(firstName: String, lastName: String, userImage: UIImage, email: String, UID: String, friends: [User: Bool]) {
        self.id = UID
        self.firstName = firstName
        self.lastName = lastName
        self.userImage = userImage
        self.userEmail = email
        self.userFriends = friends
    }
    
    init(UID: String, user: [String: Any]) {
        self.id = UID
        self.firstName = user["firstName"] as? String
        self.lastName = user["lastName"] as? String
        self.userEmail = user["email"] as? String
    }
}
