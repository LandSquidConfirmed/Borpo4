//
//  main.swift
//  TankLand
//
//  Created by Maxwell Little on 4/4/17.
//  Copyright © 2017 Maxwell Little. All rights reserved.
//

import Foundation



enum direction {
    case N
    case E
    case S
    case W
    case NE
    case SE
    case SW
    case NW
}


let t = TankWorld()


for e in 0...14 {
    t.addGameObject(object: gameObject(type: "Tank", ID: "T1", energy: 100000, position: Position(row: e, col: e)))
}

print (t)

func getRandomInt(range: Int)-> Int {
    return Int(arc4random_uniform(UInt32(range)))
}

var g = [gameObject]()

for e in 0...14 {
    g.append(gameObject(type: "Tank", ID: "T1", energy: e, position: Position(row: e, col: e)))
}

print(g)


print("\nReordered Array\n")
print(t.chooseRandomOrder(objects: g))
