//
//  formatCalcButton.swift
//  ABCalc
//
//  Created by Alban BERNARD on 16/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class formatCalcButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let button: UIButton = UIButton()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5 //(button.frame.width / 2)
        button.backgroundColor = UIColor.red
        return
    }
    
}
