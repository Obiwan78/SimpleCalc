//
//  ABOperatorCalcButton.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 24/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class ABOperatorCalcButton: ABCalcButton {

    override func setupUI() {
        super .setupUI()
        //        self.backgroundColor = UIColor.gray
        switch ABSettingsViewController._colorButton {
        case 0: // Terre
            self.backgroundColor = UIColor.orange
            self.titleLabel?.textColor = UIColor.white
        case 1: // Ciel
            self.backgroundColor = UIColor.blue
            self.titleLabel?.textColor = UIColor.white
        case 2: // Feu
            self.backgroundColor = UIColor.orange
            self.titleLabel?.textColor = UIColor.white
        case 3: // Nuit
            self.backgroundColor = UIColor.darkGray
            self.titleLabel?.textColor = UIColor.white
        default:
            self.backgroundColor = UIColor.orange
            self.titleLabel?.textColor = UIColor.white
        }
//        UserDefaults.standard.set(ABSettingsViewController._colorButton, forKey: "KEY_COLORATION_BUTTON_CALC")
        
        
        switch ABSettingsViewController._shapeButton {
        case 0 :
            self.layer.cornerRadius = 0
        case 1 :
            self.layer.cornerRadius = 10
        case 2 :
            self.layer.cornerRadius =  self.frame.width / 2
            
        default:
            self.layer.cornerRadius = 0
        }
//        UserDefaults.standard.set(ABSettingsViewController._shapeButton, forKey: "KEY_SHAPE_BUTTON_CALC")
        
        
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
//        UserDefaults.standard.set(ABSettingsViewController._fontButton, forKey: "KEY_FONT_BUTTON_CALC")
        

    }
        
        
//        self.backgroundColor = UIColor.brown
//        self.layer.cornerRadius = self.frame.width / 2
//        UserDefaults.standard.set(ABSettingsViewController._colorButton, forKey: "KEY_COLORATION_BUTTON_CALC")


}
