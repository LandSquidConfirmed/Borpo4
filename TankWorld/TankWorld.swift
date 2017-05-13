//
//  Tank World.swift
//  TankLand
//
//  Created by Maxwell Little on 4/7/17.
//  Copyright © 2017 Maxwell Little. All rights reserved.
//

import Foundation

class TankWorld: CustomStringConvertible {
    
    var gameObjects: [[gameObject?]] = Array(repeating: Array(repeating: nil, count: 15), count: 15)
    
    
    
    func addGameObject(object: gameObject){
        gameObjects[object.position.row][object.position.col] = object
    }
    
    //MARK: Finding Functions
    func findAllGameObjects() -> [gameObject] {//Account for no objects?
        var result = [gameObject]()
        for line in gameObjects {
            for object in line {
                if object != nil {
                    result.append(object!)
                }
            }
        }
        return (result)
    }
    
    
    func findAllTanks() ->[gameObject] {//account for no tanks?
        var result = [gameObject]()
        for object in findAllGameObjects() {
            if object.type == "Tank" {
                result.append(object)
            }
        }
        return result
    }
    
    func chooseRandomOrder(objects: [gameObject])->[gameObject] {
        var result = [gameObject]()
        var usedNumbers = [Int]()
        
        while 1 == 1 {
            
            let randomNum = getRandomInt(range: objects.count)
            print(randomNum)
            guard usedNumbers.contains(randomNum) else {
                usedNumbers.append(randomNum)
                result.append(objects[randomNum])
                if objects.count == result.count {
                    break
                }
                continue
            }
        }
        return result
    }
    
    func grid() -> String {
        var result = ""
        for line in 0..<15 {
            result += ("----------------------------------------------------------------------------------------------------------\n")
            for  object in 0...2 {
                for value in 0..<15 {
                    result += ("|")
                    let currentObject = gameObjects[line][value]
                    if currentObject != nil {
                        let characters = String(currentObject!.energy).characters.count
                        let coordinateChars = currentObject!.position.description.characters.count
                        switch object{
                        case 0: if characters == 6{result += "\(currentObject!.energy)"} else if characters == 5{result += "\(currentObject!.energy) "} else if characters == 4 {result += "\(currentObject!.energy)  "} else if characters == 3 {result += "\(currentObject!.energy)   "} else if characters == 2 {result += "\(currentObject!.energy)    "} else {result += "\(currentObject!.energy)     "}
                        case 1: result += "\(currentObject!.ID)    "
                        case 2: if coordinateChars == 4 {result += "\(currentObject!.position)  "} else if coordinateChars == 3 {result += "\(currentObject!.position) "} else {result += "\(currentObject!.position)"}
                        default: result += ("     ")
                        }
                    }
                    else {
                        result += ("      ")
                    }
                }
                result += "|\n"
            }
        }
        result += "----------------------------------------------------------------------------------------------------------"
        return(result)
    }
    
    
    //MARK: Driver
    /*func driver() {
        while findAllTanks().count != 1 {
            gameObjects = chooseRandomOrder(objects: gameObjects)//Game objects is a 2d array, need to fix
            for g in gameObjects{
                switch g.type {
                case "Tank": energy -= 100 //These values should be variables determined by a struct
                case "RCXD": energy -= 40
                case "Mine": energy -= 20
                }
            }
        }
    }*/
    
    
    
    var description: String {
        return grid()
    }
}

