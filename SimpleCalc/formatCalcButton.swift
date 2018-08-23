//
//  formatCalcButton.swift
//  ABCalc
//
//  Created by Alban BERNARD on 16/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class formatCalcButton: UIButton {

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

    private func customInit() {
//        self.layer.borderWidth = 0
//        self.layer.cornerRadius = 10 //(button.frame.width / 2)
//        self.backgroundColor = UIColor.red

    }
}
