//
//  CalcButton.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 24/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class ABCalcButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.customInit()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.customInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
     func customInit() {
        NotificationCenter.default.addObserver(self, selector: #selector(ABCalcButton.setupUI), name: ABSettingsViewController.SettingsNotificationKey, object: nil)
        self.setupUI()
    }
    
    @objc func setupUI() {
        self.layer.borderWidth = 0
//        self.layer.cornerRadius = 20 //( button.frame.width / 2)
    }

}
