//
//  Calculator.swift
//  Calculator
//
//  Created by Serena Lambert on 19/02/2020.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import Foundation

class Calculator {
    
    func add(_ val1: Double, _ val2: Double) -> Double {
        return val1 + val2
    }
    
    func subtract(_ val1: Double, _ val2: Double) -> Double {
        return val1 - val2
    }
    
    func multiply(_ val1: Double, _ val2: Double) -> Double {
        return val1 * val2
    }
    
    func divide(_ val1: Double, _ val2: Double) -> Double? {
        return val2 == 0 ? nil : val1 / val2
    }
    
    func percentage(_ val: Double) -> Double {
        return val / 100
    }
    
    func plusMinus(_ val: Double) -> Double {
        return val * -1
    }
    
}
