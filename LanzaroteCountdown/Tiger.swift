//
//  Tiger.swift
//  LanzaroteCountdown
//
//  Created by Dirk Boller on 16.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    
    func chuff() {
        println("Tiger: Chuff chuff")
    }
    
    func chuffANumberOfTimes(numberOfTimes: Int) {
        for var chuff = 0;chuff < numberOfTimes;++chuff {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes(numberOfTimes: Int, isLoad: Bool) {
        for var chuffTimes = 1;chuffTimes <= numberOfTimes;chuffTimes++ {
            if isLoad {
                self.chuff()
            } else {
                println("Tiger: purr purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge:Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        /*
        if randomNumber == 0 {
        randomFact = "Der Tiger ist das größte Tier der Katzenfamilie"
        }
        else if randomNumber == 1 {
        randomFact = "Tiger können eine Länge von 3,30 m erreichen"
        }
        else {
        randomFact = "Eine Gruppe von Tigern nennt man 'Rudel' oder 'Rotte'"
        }
        */
        switch randomNumber {
        case 0:
            randomFact = "Der Tiger ist das größte Tier der Katzenfamilie"
        case 1:
            randomFact = "Tiger können eine Länge von 3,30 m erreichen"
        default:
            randomFact = "Eine Gruppe von Tigern nennt man 'Rudel' oder 'Rotte'"
        }
        return randomFact
    }
}