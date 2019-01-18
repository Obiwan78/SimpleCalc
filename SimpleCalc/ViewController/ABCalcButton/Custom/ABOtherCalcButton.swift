//
//  ABOtherCalcButton.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 24/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class ABOtherCalcButton: ABCalcButton {

    override func setupUI() {
        super .setupUI()

        switch ABSettingsViewController._colorButton {
        case 0: // Terre
            self.backgroundColor = UIColor.darkGray
            self.setTitleColor(UIColor.black, for: UIControl.State.normal)
        case 1: // Ciel
            self.backgroundColor = UIColor.purple
            self.setTitleColor(UIColor.white, for: UIControl.State.normal)
        case 2: // Feu
            self.backgroundColor = UIColor.yellow
            self.setTitleColor(UIColor.red, for: UIControl.State.normal)
        case 3: // Nuit
            self.backgroundColor = UIColor.black
            self.setTitleColor(UIColor.green, for: UIControl.State.normal)
        default:
            self.backgroundColor = UIColor.lightGray
            self.setTitleColor(UIColor.red, for: UIControl.State.normal)
        }
        
        
        switch ABSettingsViewController._shapeButton {
        case 0 :
            self.layer.cornerRadius = 0
        case 1 :
            self.layer.cornerRadius = 10
        case 2 :
            self.layer.cornerRadius =  self.frame.height / 2
        default:
            self.layer.cornerRadius = 0
        }
        
        switch ABSettingsViewController._fontButton {
        case 0: // Digital-7
            self.titleLabel?.font = UIFont(name: "Digital-7", size: 40)
        case 1: // Futura
            self.titleLabel?.font  = UIFont(name: "Futura", size: 40)
        case 2: // Chalkduster
            self.titleLabel?.font  = UIFont(name: "Chalkduster", size: 40)
        default:
            self.titleLabel?.font = UIFont(name: "Digital-7", size: 40)
        }
    }
}
