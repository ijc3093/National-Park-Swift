//
//  NorthPole.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class NorthPole:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake(80, 0)
        }
    }
    //optional
    var title: String? {
        get {
            return "The North Pole"
        }
    }
    
    var subtitle: String? {
        get {
            return "Santa's Workshop"
        }
    }
    
    
}
