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
import Foundation
import StoreKit

class ViewController: UIViewController {
    
    
    var quantityOfResultButtonIsTouchedInSimpleCalc = UserDefaults.standard.integer(forKey: "QUANTITYRESULTBUTTONTOUCHED")
    var _quantityOfResultButtonIsTouched: Int = 0
    let _moduloRequestReview: Int = 50 // Default = 50 x la touche "=". valeur à modifier pour test (entre 2 et 5)
    
    var _decimalNumber = false
    var _operationType : Character = " "
    var _currentNumber : Double = 0
    var _previousNumber : Double = 0
    var _percentageResult: Double = 0

    @IBOutlet weak var ui_topLineLabel: UILabel! = nil
    
    //-------------------------------------------------
    // View Life Cycle
    //-------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        moreApps.showAlertControllerMoreApps()
//        moreAppsABERNARD()
        
        // USER DEFAULT pour SKStoreReviewController
        _quantityOfResultButtonIsTouched = quantityOfResultButtonIsTouchedInSimpleCalc

        // Voir resultButton et func requestReview()
        
        
        //-------------------------------------------------
        // infos
        //-------------------------------------------------
        
        print("viewDidLoad : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber)")
//        ui_topLineLabel.textAlignment = .left
//        ui_topLineLabel.font = UIFont(name: "digital-7", size: 25)
//        ui_bottomLineLabel.numberOfLines = 1

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue-Infos" {
            print("on passe à l'écran info, envoi email")
        }
    }
    
    //-------------------------------------------------
    // Méthodes
    //-------------------------------------------------
    
    @IBAction func digitButtonTouchedUpInside(_ sender: UIButton) {
        
        if ui_topLineLabel.text == "+" || ui_topLineLabel.text == "-" || ui_topLineLabel.text == "*" || ui_topLineLabel.text == "/" || ui_topLineLabel.text == "√" {
            ui_topLineLabel.text = ""
            _currentNumber = 0
        } else if ui_topLineLabel.text == "Entrer un nombre d'abord" || ui_topLineLabel.text == "Division par 0 impossible" || ui_topLineLabel.text == "Erreur" {
            ui_topLineLabel.text = ""
        }
        
        ui_topLineLabel.text = ui_topLineLabel.text! + String(sender.tag)
            _currentNumber = Double(ui_topLineLabel.text!)!
            print("_currentNumber = \(_currentNumber)")
    }
    
    
    @IBAction func numberDecimal(_ sender: UIButton) {
        if _decimalNumber == true {
            return
        } else {
            if (ui_topLineLabel.text?.contains("."))! {
                return
            } else {
            ui_topLineLabel.text = String(ui_topLineLabel.text! + ".")
            _currentNumber = Double(ui_topLineLabel.text!)!
            _decimalNumber = true
            }
        }
    }
    
    @IBAction func square(_ sender: UIButton) {
        if ui_topLineLabel.text != "Entrer un nombre d'abord" || ui_topLineLabel.text != "Division par 0 impossible" || ui_topLineLabel.text != "Erreur" || ui_topLineLabel.text != "+" || ui_topLineLabel.text != "-" || ui_topLineLabel.text != "*" || ui_topLineLabel.text != "/" || ui_topLineLabel.text != "√" {
            if ui_topLineLabel.text != "" {
                ui_topLineLabel.text = String(_currentNumber * _currentNumber)
                _previousNumber = _currentNumber
                _currentNumber = Double(ui_topLineLabel.text!)!
                print("SQUARE : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber) / ui_topLineLabel = \(String(describing: ui_topLineLabel.text!))")
                resetdecim()
            } else {
                ui_topLineLabel.text = "Entrer un nombre d'abord"
            }
        } else {
            ui_topLineLabel.text = "Erreur"
        }
    }
    
    
    @IBAction func squareRoot(_ sender: UIButton) {
        if ui_topLineLabel.text != "Entrer un nombre d'abord" || ui_topLineLabel.text != "Division par 0 impossible" || ui_topLineLabel.text != "Erreur" || ui_topLineLabel.text != "+" || ui_topLineLabel.text != "-" || ui_topLineLabel.text != "*" || ui_topLineLabel.text != "/" || ui_topLineLabel.text != "√" {
            if ui_topLineLabel.text == "" {
                ui_topLineLabel.text = "Entrer un nombre d'abord"
            } else {
                ui_topLineLabel.text = String(sqrt(_currentNumber))
                _previousNumber = _currentNumber
                _currentNumber = Double(ui_topLineLabel.text!)!
                print("SQUARE : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber) / ui_topLineLabel = \(String(describing: ui_topLineLabel.text!))")
                resetdecim()
            }
        } else {
        ui_topLineLabel.text = "Erreur"
        }
    }
    
    
    @IBAction func divisionButton(_ sender: UIButton) {
        ui_topLineLabel.text = "/"
        _operationType = "/"
        if _previousNumber != 0 {
            _previousNumber = _previousNumber / _currentNumber
        } else {
        _previousNumber = _currentNumber
        }
        _currentNumber = 0
        resetdecim()
        print("DivisionBUTTON : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber)")
    }
    
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        ui_topLineLabel.text = "*"
        _operationType = "*"
        if _previousNumber != 0 {
            _previousNumber = _previousNumber * _currentNumber
        } else {
        _previousNumber = _currentNumber
        }
        _currentNumber = 0
        resetdecim()
        print("MultiplyBUTTON : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber)")
    }
    
    
    @IBAction func substractButton(_ sender: UIButton) {
        ui_topLineLabel.text = "-"
        _operationType = "-"
        if _previousNumber != 0 {
            _previousNumber = _previousNumber - _currentNumber
        } else {
            _previousNumber = _currentNumber
        }
        _currentNumber = 0
        resetdecim()
        print("SubstractBUTTON : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber)")
    }
    
    
    @IBAction func additionButton(_ sender: UIButton) {
        ui_topLineLabel.text = "+"
        _operationType = "+"
        if _previousNumber != 0 {
            _previousNumber = _previousNumber + _currentNumber
        } else {
            _previousNumber = _currentNumber
        }
        _currentNumber = 0
        resetdecim()
        print("AdditionBUTTON : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber)")
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        _quantityOfResultButtonIsTouched = _quantityOfResultButtonIsTouched + 1
        if (_quantityOfResultButtonIsTouched % _moduloRequestReview == 0) {
            requestReview()
        }
        quantityOfResultButtonIsTouchedInSimpleCalc = _quantityOfResultButtonIsTouched
        UserDefaults.standard.set(_quantityOfResultButtonIsTouched , forKey: "QUANTITYRESULTBUTTONTOUCHED")
        print("Lauched SIMPLE CALC : quantityOfResultButtonIsTouched = \(_quantityOfResultButtonIsTouched)")
        print("quantityOfResultButtonIsTouchedInSimpleCalc = \(quantityOfResultButtonIsTouchedInSimpleCalc)")
        performWaitingCalculous()
    }
    
    
    @IBAction func applyPercentButton(_ sender: UIButton) {
        _percentageResult = (_currentNumber / 100) // 0,2 = 20%
        switch _operationType {
        case "-":
            ui_topLineLabel.text = String(_previousNumber - _previousNumber * _percentageResult);
        case "+" :
            ui_topLineLabel.text = String(_previousNumber + _previousNumber * _percentageResult);
        case "*" :
            ui_topLineLabel.text = String(_previousNumber * _percentageResult);
        case "/" :
            if _currentNumber != 0 {
                ui_topLineLabel.text = String(_previousNumber / _percentageResult)
            } else {
                ui_topLineLabel.text = "Division par 0 impossible"
            };
        default :
            ui_topLineLabel.text = String(_currentNumber/100)
            _percentageResult = _currentNumber / 100 ;
        }
        print("RESULT : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber), percentResult = \(_percentageResult)")
        _currentNumber = Double(ui_topLineLabel.text!)!
        print(_currentNumber)
    }
    
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        if ui_topLineLabel.text == "Division par 0 impossible" || ui_topLineLabel.text == "Erreur" || ui_topLineLabel.text == "Entrer un nombre d'abord" || ui_topLineLabel.text == "+" || ui_topLineLabel.text == "-" || ui_topLineLabel.text == "*" || ui_topLineLabel.text == "/" || ui_topLineLabel.text == "^" || ui_topLineLabel.text == "" {
            ui_topLineLabel.text = ""
            _currentNumber = 0
            return
        } else {
        ui_topLineLabel.text = String(Double(ui_topLineLabel.text!)! * -1)
        _currentNumber = Double(ui_topLineLabel.text!)!
        print("ChangeSign : _currentNumber = \(_currentNumber) / ui_topLineLabel = \(String(describing: ui_topLineLabel.text!))")
        //        _shouldResetCurrentNumber = false
        }
    }
    
    
    @IBAction func resetAllValueButton(_ sender: UIButton) { // All Clear
        ui_topLineLabel.text = ""
        _previousNumber = 0
        _currentNumber = 0
        _operationType = " "
        print("Reset All Value : _currentNumber = \(_currentNumber) / _previousNumber = \(_previousNumber)")
        _percentageResult = 0
        resetdecim()
    }
    
    
    @IBAction func ResetCurrentNumber(_ sender: UIButton) {
        ui_topLineLabel.text = ""
        _currentNumber = 0
        print("Reset Current Number : _currentNumber = \(_currentNumber) / _previousNumber = \(_previousNumber)")
        resetdecim()
        
    }
    
    
    @IBAction func eraseLastDigit(_ sender: UIButton) {
        if ui_topLineLabel.text == "Division par 0 impossible" || ui_topLineLabel.text == "Erreur" || ui_topLineLabel.text == "Entrer un nombre d'abord" || ui_topLineLabel.text == "+" || ui_topLineLabel.text == "-" || ui_topLineLabel.text == "*" || ui_topLineLabel.text == "/" || ui_topLineLabel.text == "^" || ui_topLineLabel.text == "" {
            ui_topLineLabel.text = ""
            return
        }
        
        if _currentNumber.isZero == true {
            ui_topLineLabel.text = ""
            return
        }
        
        if (ui_topLineLabel.text?.count)! <= 2 && (ui_topLineLabel.text?.contains("-"))! {
            ui_topLineLabel.text = ""
            _currentNumber = 0
            return
        }
        
        if (ui_topLineLabel.text?.count)! == 1 {
            ui_topLineLabel.text = ""
            _currentNumber = 0
            return
        }
        
        ui_topLineLabel.text?.removeLast()
        _currentNumber = Double(ui_topLineLabel.text!)!
        print("ERASE LAST DIGIT : _currentNumber = \(_currentNumber) / ui_topLineLabel = \(String(describing: ui_topLineLabel.text!))")
        _decimalNumber = true
    }
    
    
    //-------------------------------------------------
    // Fonctions
    //-------------------------------------------------

    func resetdecim () {
        _decimalNumber = false
//        _decim = 1
//        _numdecim = 0
    }
    
    
    func performWaitingCalculous() {
            switch _operationType {
            case "+":
                ui_topLineLabel.text = String(_previousNumber + _currentNumber)
                _currentNumber = _previousNumber + _currentNumber
                _decimalNumber = true
            case "-" :
                ui_topLineLabel.text = String(_previousNumber - _currentNumber)
                _currentNumber = Double(_previousNumber - _currentNumber)
                _decimalNumber = true
            case "*" :
                ui_topLineLabel.text = String(_previousNumber * _currentNumber)
                _currentNumber = Double(_previousNumber * _currentNumber)
                _decimalNumber = true
            case "/" :
                if _currentNumber != 0 {
                    ui_topLineLabel.text = String(_previousNumber / _currentNumber)
                    _currentNumber = Double(_previousNumber / _currentNumber)
                    _decimalNumber = true
                } else {
                    ui_topLineLabel.text = "Division par 0 impossible"
                };
            default : ui_topLineLabel.text = "Erreur"
                resetdecim();
            }
        _previousNumber = 0
        print("RESULTAT : _previousNumber = \(_previousNumber) ET _currentNumber = \(_currentNumber)")
        _operationType = " "
    }

    func updateDisplay() {
        ui_topLineLabel.text = "\(_currentNumber)"
    }

    
    func requestReview() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
//            moreApps.showAlertControllerMoreApps()
            moreAppsABERNARD()
        }
    }
    
    
    func moreAppsABERNARD () {
        let alertController = UIAlertController(title: "Voir nos applications", message: "Nous vous proposons de regarder nos autres applications sur l'AppStore ou sur notre site internet", preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction( title: "Sur le site internet",
                                                 style: .default,
                                                 handler: {
                                                    (action:UIAlertAction!) -> Void in
                                                    UIApplication.shared.open(URL(fileURLWithPath: "https://albanbernard.fr/ios-apps"), options: [:], completionHandler: nil)
//                                                    UIApplication.shared.open(URL(fileURLWithPath: "htpps://albanbernard.fr/ios-apps"))
                                                    }))

        alertController.addAction(UIAlertAction(title: "Sur l'AppStore",
                                                style: .default,
                                                handler: { (_ ) in
                                                    UIApplication.shared.open(URL(fileURLWithPath: "https://itunes.apple.com/fr/app/le-nombre-secret/id1425470784"))
                                                    }))

        alertController.addAction(UIAlertAction(title: "Fermer", style: .cancel, handler: nil))

        presentedViewController?.present(alertController, animated: true, completion: nil)

    }

}


