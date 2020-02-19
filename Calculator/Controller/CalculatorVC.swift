//
//  ViewController.swift
//  Calculator
//
//  Created by Serena Lambert on 19/02/2020.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var secondaryLbl: UILabel!
    
    // MARK: - FUNCTIONS AND CONSTANTS
    
    let calc = Calc()
    var result: Double = 0
    var currentNum = ""
    
    // MARK: - SYSTEM FUNCTIONS

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = ""
        secondaryLbl.text = ""
    }
    
    // MARK: - OPERATION FUNCTIONS

    func operationSelected(operation: Operation) {
        
        if calc.operation == nil {
            calc.val1 = getCurrentNum()
        } else {
            calc.val2 = getCurrentNum()
            calc.operate()
        }
        
        if operation != .equals {
            calc.operation = operation
        }
        
        currentNum = ""
        updateResultLbl()
        checkForError()
    }
    
    func changeSign() {
        if currentNum == "" {
            currentNum = String(describing: calc.val1)
        }
        if currentNum.hasPrefix("-") {
            currentNum.remove(at: currentNum.startIndex)
        } else {
            currentNum = "-\(currentNum)"
        }
        resultLbl.text = currentNum
    }
    
    func percentageSelected() {
        calc.val1 = getCurrentNum()
        calc.operation = .percentage
        calc.operate()
        currentNum = ""
        updateResultLbl()
    }
    
    func delete() {
        currentNum = String(currentNum.dropLast())
        resultLbl.text = currentNum
    }
    
    // MARK: - HELPER FUNCTIONS
    
    func checkForError() {
        if calc.error != nil {
            showError()
            calc.error = nil
        }
    }
    
    func getOperation(forTag tag: Int) -> Operation {
        switch tag {
            case 0: return .add
            case 1: return .subtract
            case 2: return .multiply
            case 3: return .divide
            case 4: return .equals
            default: return .add
        }
    }
    
    func showError() {
        let alertController = UIAlertController(title: "Error", message:
            calc.error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addCharToCurrentNum(char: String) {
        currentNum += char
        resultLbl.text = currentNum
    }
    
    func getCurrentNum() -> Double {
        if currentNum == "" {
            return calc.val1
        } else {
            return Double(currentNum) ?? 0.0
        }
    }

    func clear() {
        calc.val1 = 0
        calc.val2 = nil
        calc.operation = nil
        currentNum = ""
        resultLbl.text = ""
        secondaryLbl.text = ""
    }

    func updateResultLbl() {
        resultLbl.text = "\(calc.val1)"
    }
    
    // MARK: - ACTIONS
    
    @IBAction func numberBtnPressed(_ sender: SymbolButton) {
        addCharToCurrentNum(char: sender.tag.description)
    }
    
    @IBAction func decimalBtnPressed(_ sender: Any) {
        if !currentNum.contains(".") {
            addCharToCurrentNum(char: ".")
        }
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        clear()
    }
    @IBAction func deleteBtnPressed(_ sender: Any) {
        delete()
    }
    
    @IBAction func plusMinusBtnPressed(_ sender: Any) {
        changeSign()
    }
    
    @IBAction func percentageBtnPressed(_ sender: Any) {
        percentageSelected()
    }
    
    @IBAction func operationBtnPressed(_ sender: SymbolButton) {
        let operation = getOperation(forTag: sender.tag)
        operationSelected(operation: operation)
    }
    
}
    
    
    
