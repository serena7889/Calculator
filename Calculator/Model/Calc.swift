//
//  Calculator.swift
//  Calculator
//
//  Created by Serena Lambert on 19/02/2020.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import Foundation

class Calc {
    
    var val1: Double = 0.0
    var val2: Double?
    var operation: Operation?
    var error: String? = nil
    
    func operate() {
        switch operation {
            case .add: add()
            case .subtract: subtract()
            case .multiply: multiply()
            case .divide: divide()
            case .percentage: percentage()
            default: return
        }
        operation = nil
    }
    
    func add() {
        if let v2 = val2 {
            val1 += v2
        }
    }
    
    
    func subtract() {
        if let v2 = val2 {
            val1 -= v2
        }
    }

    func multiply() {
        if let v2 = val2 {
            val1 *= v2
        }
    }

    func divide() {
        if val2 == 0 {
            error = "Cannot divide by zero"
        } else if let v2 = val2 {
            val1 /= v2
        }
    }

    func percentage() {
        val1 /= 100
    }

    func plusMinus() {
        val1 *= -1
    }
    
}
