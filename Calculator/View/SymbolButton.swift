//
//  SymbolButton.swift
//  Calculator
//
//  Created by Serena Lambert on 19/02/2020.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import UIKit

@IBDesignable
class SymbolButton: UIButton {
    
    @IBInspectable var operation: Bool = false {
        didSet {
            backgroundColor = operation ? #colorLiteral(red: 0.1812868065, green: 0.8083558058, blue: 0.5449074254, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.05)
            setTitleColor(operation ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.1812868065, green: 0.8083558058, blue: 0.5449074254, alpha: 1), for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        setUpView()
    }
    
    func setUpView() {
        layer.cornerRadius = frame.size.height / 2
        titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 20)
    }

}
