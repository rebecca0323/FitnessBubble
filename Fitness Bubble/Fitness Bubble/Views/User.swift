//
//  User.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/25/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import Foundation

class User {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
