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
    var _decimalNumber = false
    var _operationType : Character = " "
//    var _intergerPart : Int = 0
//    var _decim : Double = 1
//    var _numdecim : Double = 0
    var _currentNumber : Double = 0
    //    {
    //        didSet {
    //            ui_topLineLabel.text = "\(_currentNumber)"
    //        }
    //    }
    var _previousNumber : Double = 0
    var _percentageResult: Double = 0


    @IBOutlet weak var ui_topLineLabel: UILabel! = nil
//    @IBOutlet weak var ui_bottomLineLabel: UILabel! = nil

    //-------------------------------------------------
    // View Life Cycle
    //-------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ui_topLineLabel.numberOfLines = 1
//        ui_topLineLabel.textAlignment = .left
//        ui_topLineLabel.font = UIFont(name: "digital-7", size: 25)
        
//        ui_bottomLineLabel.numberOfLines = 1
        
        // Do any additional setup after loading the view, typically from a nib.
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
        
        //        if _decimalNumber == true {
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
        if _decimalNumber == true {
            return
        } else {
            ui_topLineLabel.text = String(ui_topLineLabel.text! + ".")
            _currentNumber = Double(ui_topLineLabel.text!)!
            // _numdecim = _currentNumber
            //ui_currentNumberLabel.text = “(_numdecim)”
            _decimalNumber = true
        }
    }
    
    @IBAction func square(_ sender: UIButton) {
        if ui_topLineLabel.text != "Entrer un nombre d'abord" || ui_topLineLabel.text != "Division par 0 impossible" || ui_topLineLabel.text != "Erreur" || ui_topLineLabel.text != "+" || ui_topLineLabel.text != "-" || ui_topLineLabel.text != "*" || ui_topLineLabel.text != "/" || ui_topLineLabel.text != "√" {
            if ui_topLineLabel.text != "" {
                //          if _shouldResetCurrentNumber == true {
                //             _currentNumber = _previousNumber
                //          }
                //          _shouldResetCurrentNumber = false
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
                //          if _shouldResetCurrentNumber == true {
                //             _currentNumber = _previousNumber
                //          }
                //          _shouldResetCurrentNumber = false
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
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
//        if _previousNumber != 0 && _operationType == "/" {
//            ui_topLineLabel.text = "/"
//            _operationType = "/"
//            performWaitingCalculous()
//        } else {

        ui_topLineLabel.text = "/"
        _operationType = "/"
//        if _previousNumber != 0 {
//            _previousNumber = _previousNumber / _currentNumber
//            _currentNumber = _previousNumber
//            print("RESULT / : _previousNumber = \(_previousNumber), _currentNumber = \(_currentNumber)")
//        } else {
            _previousNumber = _currentNumber
            _currentNumber = 0
//        }

        resetdecim()
//        }
    }

    @IBAction func multiplyButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        ui_topLineLabel.text = "*"
        _operationType = "*"
        _previousNumber = _currentNumber
        _currentNumber = 0
        resetdecim()
//        }
    }

    @IBAction func substractButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        ui_topLineLabel.text = "-"
        _operationType = "-"
        _previousNumber = _currentNumber
        _currentNumber = 0
        resetdecim()
    }
    
    @IBAction func additionButton(_ sender: UIButton) {
//        if _shouldResetCurrentNumber == false {
//            performWaitingCalculous()
//        }
        ui_topLineLabel.text = "+"
        _operationType = "+"
        _previousNumber = _currentNumber
        _currentNumber = 0
        resetdecim()
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
        //        if _shouldResetCurrentNumber == true {
        //            _currentNumber = _previousNumber}
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
        //        _previousNumber = _currentNumber
        _currentNumber = 0
        print("Reset Current Number : _currentNumber = \(_currentNumber) / _previousNumber = \(_previousNumber)")
        resetdecim()
        
    }
    
    
    @IBAction func eraseLastDigit(_ sender: UIButton) {
        //        var StringNumber: String = String(_currentNumber)
        //        print(StringNumber)
        //        StringNumber.removeLast()
        //        print(StringNumber)
        //        _currentNumber = Double(StringNumber)!
        //        updateDisplay()
        if ui_topLineLabel.text == "Division par 0 impossible" || ui_topLineLabel.text == "Erreur" || ui_topLineLabel.text == "Entrer un nombre d'abord" || ui_topLineLabel.text == "+" || ui_topLineLabel.text == "-" || ui_topLineLabel.text == "*" || ui_topLineLabel.text == "/" || ui_topLineLabel.text == "^" || ui_topLineLabel.text == "" {
            ui_topLineLabel.text = ""
        } else if ui_topLineLabel.text?.count != 1 || Double(ui_topLineLabel.text!)! < 0 && (ui_topLineLabel.text?.count)! >= 2 {
            ui_topLineLabel.text?.removeLast()
            _currentNumber = Double(ui_topLineLabel.text!)!
            print("ERASE LAST DIGIT : _currentNumber = \(_currentNumber) / ui_topLineLabel = \(String(describing: ui_topLineLabel.text!))")
            _decimalNumber = true
        }
    }
    
    
    //-------------------------------------------------
    // Fonctions
    //-------------------------------------------------

    func resetdecim () {
        _decimalNumber = false
//        _decim = 1
//        _numdecim = 0
    }

//    func calculResultat(duNombre nb1:Double, avecLeNombre nb2:Double, viaOperateur operateur:String) -> Double {}
    
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
        
//      _shouldResetCurrentNumber = true
        print("RESULTAT : _previousNumber = \(_previousNumber) ET _currentNumber = \(_currentNumber)")
        _operationType = " "
    }

    func updateDisplay() {
        ui_topLineLabel.text = "\(_currentNumber)"
        
    }
    
    func testInternetAndWifiConnexion() {
        // check internet connexion
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alertController = UIAlertController.init(title: "Aucune Connexion Internet", message: "Veuillez vérifier votre connexion (wifi ou données mobiles).", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_ ) in print("Arreter le téléchargement car il n'y a pas de données mobile ou wifi activés")} ))
            alertController.addAction(UIAlertAction(title: "Activer le wifi", style: .default, handler: { (_ ) in
                print("Activation Wifi")
            }))
            alertController.addAction(UIAlertAction(title: "Activer les données mobiles", style: .default, handler: { (_ ) in
                print("Activation Données Mobiles")
            }))
            present(alertController, animated: true, completion: nil)
        }
        return
    }


}

