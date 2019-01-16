//
//  DigitCalcButton.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 24/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class ABDigitCalcButton: ABCalcButton {
    
    //-------------------------------------------------
    // Couleur des boutons DIGIT
    //-------------------------------------------------
    override func setupUI() {
        super .setupUI()
        switch ABSettingsViewController._colorButton {
        case 0: // Terre
            self.backgroundColor = UIColor.lightGray
            self.setTitleColor(UIColor.black, for: UIControlState.normal)
        case 1: // Ciel
            self.backgroundColor = UIColor.cyan
            self.setTitleColor(UIColor.black, for: UIControlState.normal)
        case 2: // Feu
            self.backgroundColor = UIColor.red
            self.setTitleColor(UIColor.white, for: UIControlState.normal)
        case 3: // Nuit
            self.backgroundColor = UIColor.black
            self.setTitleColor(UIColor.red, for: UIControlState.normal)
        default:
            self.backgroundColor = UIColor.lightGray
            self.setTitleColor(UIColor.red, for: UIControlState.normal)
        }
        
        //-------------------------------------------------
        // Forme des boutons DIGIT
        //-------------------------------------------------
        switch ABSettingsViewController._shapeButton {
        case 0 :
            self.layer.cornerRadius = 0
//            UserDefaults.standard.set(ABSettingsViewController._shapeButton, forKey: "KEY_SHAPE_BUTTON_CALC")
        case 1 :
            self.layer.cornerRadius = 10
//            UserDefaults.standard.set(ABSettingsViewController._shapeButton, forKey: "KEY_SHAPE_BUTTON_CALC")
        case 2 :
            self.layer.cornerRadius =  self.frame.height / 2
//            UserDefaults.standard.set(ABSettingsViewController._shapeButton, forKey: "KEY_SHAPE_BUTTON_CALC")
        default:
            self.layer.cornerRadius = 0
//            UserDefaults.standard.set(ABSettingsViewController._shapeButton, forKey: "KEY_SHAPE_BUTTON_CALC")
        }
        
        //-------------------------------------------------
        // Fonte des boutons DIGIT
        //-------------------------------------------------
        switch ABSettingsViewController._fontButton {
        case 0: // Digital-7
            self.titleLabel?.font = UIFont(name: "Digital-7", size: 40)
//            UserDefaults.standard.set(ABSettingsViewController._fontButton, forKey: "KEY_FONT_BUTTON_CALC")
        case 1: // Futura
            self.titleLabel?.font  = UIFont(name: "Futura", size: 40)
//            UserDefaults.standard.set(ABSettingsViewController._fontButton, forKey: "KEY_FONT_BUTTON_CALC")
        case 2: // Chalkduster
            self.titleLabel?.font  = UIFont(name: "Chalkduster", size: 40)
//            UserDefaults.standard.set(ABSettingsViewController._fontButton, forKey: "KEY_FONT_BUTTON_CALC")
        default:
            self.titleLabel?.font = UIFont(name: "Digital-7", size: 40)
//            UserDefaults.standard.set(ABSettingsViewController._fontButton, forKey: "KEY_FONT_BUTTON_CALC")
        }
        
    }
    
}

