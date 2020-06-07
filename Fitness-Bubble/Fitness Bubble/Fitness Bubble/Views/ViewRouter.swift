//
//  ViewRouter.swift
//  Fitness Bubble
//
//  Created by rebecca on 4/25/20.
//  Copyright © 2020 Metrohack Team. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "Splash" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
}
