//
//  Utils.swift
//  MP5
//
//  Created by Candace Chiang on 3/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import Foundation

class Utils {
    static func checkEmail(email: String) -> Bool {
        if !(email.contains("@") && email.contains(".") && email.count >= 5) {
            return false
        }
        return true
    }
}
