//
//  RoundedView.swift
//  Calculator
//
//  Created by Serena Lambert on 19/02/2020.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        setUpView()
    }
    
    func setUpView() {
        layer.cornerRadius = 30
        clipsToBounds = true
    }

}
