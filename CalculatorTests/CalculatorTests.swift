//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Serena Lambert on 19/02/2020.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func testAdd() {
        
        let calc = Calc()
        
        calc.val1 = 5.7
        calc.val2 = 3.6
        calc.operation = .add
        calc.operate()
        XCTAssert(calc.val1 == (5.7 + 3.6))
        
        calc.val2 = 2.8
        calc.operation = .add
        calc.operate()
        XCTAssert(calc.val1 == (5.7 + 3.6 + 2.8))
        
    }
    
    func testPercentage() {
        let calc = Calc()
        
        calc.val1 = 70
        calc.operation = .percentage
        calc.operate()
        XCTAssert(calc.val1 == (70 / 100))
    }

}
