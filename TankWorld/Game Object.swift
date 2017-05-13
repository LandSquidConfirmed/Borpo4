//
//  Game Object.swift
//  TankLand
//
//  Created by Maxwell Little on 4/6/17.
//  Copyright © 2017 Maxwell Little. All rights reserved.
//

import Foundation

class gameObject: CustomStringConvertible {
    
    let type: String
    let ID: String
    var energy = 0
    var position: Position
    
    init (type: String, ID: String, energy: Int, position: Position) {
        self.type = type
        self.ID = ID
        self.energy = energy
        self.position = position
    }
    
    
    var description: String {
        return "\(type), \(ID), \(energy), \(position)"
    }
    
}
