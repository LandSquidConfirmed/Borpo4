//
//  Location.swift
//  TankLand
//
//  Created by Maxwell Little on 4/4/17.
//  Copyright © 2017 Maxwell Little. All rights reserved.
//

import Foundation

struct Position: CustomStringConvertible {
    var row: Int
    var col: Int
    
    
    var description: String {
        return "\(row), \(col)"
    }
}
