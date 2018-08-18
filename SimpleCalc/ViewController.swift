//
// ViewController.swift
// ABCalc
//
// Created by Alban BERNARD on 07/09/2017.
// Nouvlle verison on 16/08/2018.
//
// Copyright © 2017 AB Production :). All rights reserved.
/*
Calculatrice, modifié me 16/08/2018 suite remarques Espérance
 ---

*/

import UIKit

class ViewController: UIViewController {
    
//    var _shouldResetCurrentNumber = true
//    var _NumToDecimal = false
    var _operationType : Character = " "
//    var _intergerPart : Int = 0
//    var _decim : Double = 1
//    var _numdecim : Double = 0
    var _currentNumber : Double = 0
    //    {
    //        didSet {
    //            ui_numberLabel.text = "\(_currentNumber)"
    //        }
    //    }
    var _previousNumber : Double = 0
    var _percentageResult: Double = 0


    @IBOutlet weak var ui_numberLabel: UILabel! = nil
//    @IBOutlet weak var ui_eraseButton: UIButton!

    //-------------------------------------------------
    // View Life Cycle
    //-------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //-------------------------------------------------
    // Méthodes
    //-------------------------------------------------
    
    @IBAction func digitButtonTouchedUpInside(_ sender: UIButton) {
        
        if ui_numberLabel.text == "+" || ui_numberLabel.text == "-" || ui_numberLabel.text == "*" || ui_numberLabel.text == "/" || ui_numberLabel.text == "√" {
            ui_numberLabel.text = ""
            _currentNumber = 0
        } else if ui_numberLabel.text == "Enter a number before" || ui_numberLabel.text == "Divide by 0 is impossible" {
            ui_numberLabel.text = ""
        }
        
        ui_numberLabel.text = ui_numberLabel.text! + String(sender.tag)
        _currentNumber = Double(ui_numberLabel.text!)!
        print("_currentNumber = \(_currentNumber)")
        
        //        if _NumToDecimal == true {
        //            _decim = _decim * 10
        //            _numdecim = Double(sender.tag)
        //            _currentNumber = _currentNumber + (_numdecim / _decim)
        //            updateDisplay()
        //        }
        //        else if _shouldResetCurrentNumber == true {
        //            _currentNumber = Double(sender.tag)
        //            _shouldResetCurrentNumber = false
        //        }
        //        else { _currentNumber = (_currentNumber * 10 ) + Double(sender.tag)
        //
        //        }
    }
    
    
    @IBAction func numberDecimal(_ sender: UIButton) {
//        _NumToDecimal = true
        ui_numberLabel.text = String(ui_numberLabel.text! + ".")
        _currentNumber = Double(ui_numberLabel.text!)!
        // _numdecim = _currentNumber
        //ui_currentNumberLabel.text = “(_numdecim)”
    }
    
    
    @IBAction func square(_ sender: UIButton) {
        if ui_numberLabel.text == "" {
            ui_numberLabel.text = "Enter a number before"
        } else {
            //          if _shouldResetCurrentNumber == true {
            //             _currentNumber = _previousNumber
            //          }
            //          _shouldResetCurrentNumber = false
            ui_numberLabel.text = String(_currentNumber * _currentNumber)
            _previousNumber = _currentNumber
            _currentNumber = Double(ui_numberLabel.text!)!
            print("SQUARE : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber) / ui_numberLabel = \(String(describing: ui_numberLabel.text!))")
        }
    }
    
    
    @IBAction func squareRoot(_ sender: UIButton) {
        if ui_numberLabel.text == "" {
            ui_numberLabel.text = "Enter a number before"
        } else {
            //          if _shouldResetCurrentNumber == true {
            //             _currentNumber = _previousNumber
            //          }
            //          _shouldResetCurrentNumber = false
            ui_numberLabel.text = String(sqrt(_currentNumber))
            _previousNumber = _currentNumber
            _currentNumber = Double(ui_numberLabel.text!)!
            print("SQUARE : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber) / ui_numberLabel = \(String(describing: ui_numberLabel.text!))")
        }
    }
    
    
    @IBAction func divisionButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        ui_numberLabel.text = "/"
        _operationType = "/"
        _previousNumber = _currentNumber
        _currentNumber = 0
//        resetdecimal()
    }

    @IBAction func multiplyButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        if ui_numberLabel.text == "" {
            ui_numberLabel.text = "Enter a number before"
        }
        ui_numberLabel.text = "*"
        _operationType = "*"
        _previousNumber = _currentNumber
        _currentNumber = 0
//        resetdecimal()
    }

    @IBAction func substractButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        ui_numberLabel.text = "-"
        _operationType = "-"
        _previousNumber = _currentNumber
        _currentNumber = 0
//        resetdecimal()
    }
    
    @IBAction func additionButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        ui_numberLabel.text = "+"
        _operationType = "+"
        _previousNumber = _currentNumber
        _currentNumber = 0
//        resetdecimal()
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        performWaitingCalculous()
    }


    
    
    @IBAction func applyPercentButton(_ sender: UIButton) {
        //        if _shouldResetCurrentNumber == true {
        //            _currentNumber = _previousNumber}
        
        _percentageResult = (_currentNumber / 100) // 0,2 = 20%
        //        var totalPercentageApply: Double = 0
        //        totalPercentageApply = _previousNumber * _percentageResult // si _previousNumber vaut 50 alors totalPercentageApply vaut 10
        switch _operationType {
        case "-":
            ui_numberLabel.text = String(_previousNumber - _previousNumber * _percentageResult);
        case "+" :
            ui_numberLabel.text = String(_previousNumber + _previousNumber * _percentageResult);
        case "*" :
            ui_numberLabel.text = String(_previousNumber * _percentageResult);
        case "/" :
            if _currentNumber != 0 {
                ui_numberLabel.text = String(_previousNumber / _percentageResult)
            } else {
                ui_numberLabel.text = "Divide by 0 is impossible"
            };
        default :
            ui_numberLabel.text = String(_currentNumber/100)
            _percentageResult = _currentNumber / 100 ;
        }
        print("RESULT : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber), percentResult = \(_percentageResult)")
        _currentNumber = Double(ui_numberLabel.text!)!
        print(_currentNumber)
    }
    
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        //        if _shouldResetCurrentNumber == true {
        //            _currentNumber = _previousNumber}
        ui_numberLabel.text = String(Double(ui_numberLabel.text!)! * -1)
        _currentNumber = Double(ui_numberLabel.text!)!
        print("ChangeSign : _currentNumber = \(_currentNumber) / ui_numberLabel = \(String(describing: ui_numberLabel.text!))")
        //        _shouldResetCurrentNumber = false
    }
    
    
    @IBAction func resetAllValueButton(_ sender: UIButton) { // All Clear
        ui_numberLabel.text = ""
        _previousNumber = 0
        _currentNumber = 0
        _operationType = " "
        resetdecimal()
        print("Reset All Value : _currentNumber = \(_currentNumber) / _previousNumber = \(_previousNumber)")
        _percentageResult = 0
    }
    
    
    @IBAction func ResetCurrentNumber(_ sender: UIButton) {
        ui_numberLabel.text = ""
        //        _previousNumber = _currentNumber
        _currentNumber = 0
        resetdecimal()
        print("Reset Current Number : _currentNumber = \(_currentNumber) / _previousNumber = \(_previousNumber)")
    }
    
    
    @IBAction func eraseLastDigit(_ sender: UIButton) {
        //        var StringNumber: String = String(_currentNumber)
        //        print(StringNumber)
        //        StringNumber.removeLast()
        //        print(StringNumber)
        //        _currentNumber = Double(StringNumber)!
        //        updateDisplay()
        if (ui_numberLabel.text?.count)! >= 2 {
            ui_numberLabel.text?.removeLast()
            _currentNumber = Double(ui_numberLabel.text!)!
            print("ERASE LAST DIGIT : _currentNumber = \(_currentNumber) / ui_numberLabel = \(String(describing: ui_numberLabel.text!))")
        }
    }
    
    
    //-------------------------------------------------
    // Fonctions
    //-------------------------------------------------

    func resetdecimal () {
//        _NumToDecimal = false
//        _decim = 1
//        _numdecim = 0
    }

//    func calculResultat(duNombre nb1:Double, avecLeNombre nb2:Double, viaOperateur operateur:String) -> Double {}
    
    func performWaitingCalculous() {
            switch _operationType {
            case "+":
                ui_numberLabel.text = String(_previousNumber + _currentNumber)
            case "-" :
                ui_numberLabel.text = String(_previousNumber - _currentNumber)
            case "*" :
                ui_numberLabel.text = String(_previousNumber * _currentNumber)
            case "/" :
                if _currentNumber != 0 {
                    ui_numberLabel.text = String(_previousNumber / _currentNumber)
                } else {
                    ui_numberLabel.text = "Divide by 0 is impossible"
                };
            default : ui_numberLabel.text = "Error" ;
            }
            
        _currentNumber = Double(ui_numberLabel.text!)!
//      _shouldResetCurrentNumber = true
        print("RESULTAT : _previousNumber = \(_previousNumber) ET _currentNumber = \(_currentNumber)")
    }

    func updateDisplay() {
        
//        ui_numberLabel.text = "\(_currentNumber)"
        
    }
    
//    @objc func displayButton() {
//
//    }

}

