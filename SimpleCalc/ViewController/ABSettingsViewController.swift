//
//  ABSettingsViewController.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 24/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit

class ABSettingsViewController: UIViewController {
    
    public static let SettingsNotificationKey : NSNotification.Name = NSNotification.Name(rawValue: "SettingsDidChange")
    
    private static let KEY_COLORATION_BUTTON_CALC : String = "KEY_COLORATION_BUTTON_CALC"
    static var _colorButton = UserDefaults.standard.integer(forKey: KEY_COLORATION_BUTTON_CALC)
    
    private static let KEY_SHAPE_BUTTON_CALC : String = "KEY_SHAPE_BUTTON_CALC"
    static var _shapeButton = UserDefaults.standard.integer(forKey: KEY_SHAPE_BUTTON_CALC)
    
    private static let KEY_FONT_BUTTON_CALC : String = "KEY_FONT_BUTTON_CALC"
    static var _fontButton = UserDefaults.standard.integer(forKey: KEY_FONT_BUTTON_CALC)
    
    @IBOutlet weak var ui_titleChooseYourOptionsLabel: UILabel!
    @IBOutlet weak var ui_colorsLabel: UILabel! //  Thème des boutons
    @IBOutlet weak var ui_colorsSegementedControl: UISegmentedControl!
    @IBOutlet weak var ui_buttonShapeLabel: UILabel! //  Forme des boutons
    @IBOutlet weak var ui_buttonShapeSegementedControl: UISegmentedControl!
    @IBOutlet weak var ui_fontLabel: UILabel! //  Font des boutons
    @IBOutlet weak var ui_fontSegementControl: UISegmentedControl!
    
    override func viewDidLoad() {
        ui_colorsSegementedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: ABSettingsViewController.KEY_COLORATION_BUTTON_CALC)
        ui_buttonShapeSegementedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: ABSettingsViewController.KEY_SHAPE_BUTTON_CALC)
        ui_fontSegementControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: ABSettingsViewController.KEY_FONT_BUTTON_CALC)

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    var quantityOfResultButtonIsTouchedInSimpleCalc = UserDefaults.standard.integer(forKey: KEY_QUANTITY_RESULT_BUTTON_TOUCHED)
    
    @IBAction func preferenceColorationSegementedControl(_ sender: Any) {
        ABSettingsViewController._colorButton = ui_colorsSegementedControl.selectedSegmentIndex
        UserDefaults.standard.set(ABSettingsViewController._colorButton, forKey: ABSettingsViewController.KEY_COLORATION_BUTTON_CALC)
        NotificationCenter.default.post(name: ABSettingsViewController.SettingsNotificationKey, object: nil)
        print("Bouton Couleurs = \(ABSettingsViewController._colorButton)")
        print("\(ABSettingsViewController.SettingsNotificationKey)")
    }
    
    
    @IBAction func preferenceButtonShapeSegmentedControl(_ sender: Any) {
        ABSettingsViewController._shapeButton = ui_buttonShapeSegementedControl.selectedSegmentIndex
        UserDefaults.standard.set(ABSettingsViewController._shapeButton, forKey: ABSettingsViewController.KEY_SHAPE_BUTTON_CALC)
        NotificationCenter.default.post(name: ABSettingsViewController.SettingsNotificationKey, object: nil)
        print("Bouton Shpae = \(ABSettingsViewController._shapeButton)")
        print("\(ABSettingsViewController.SettingsNotificationKey)")
    }
    
    
    @IBAction func preferenceFontSegmentedControl(_ sender: Any) {
        ABSettingsViewController._fontButton = ui_fontSegementControl.selectedSegmentIndex
        UserDefaults.standard.set(ABSettingsViewController._fontButton, forKey: ABSettingsViewController.KEY_FONT_BUTTON_CALC)
        NotificationCenter.default.post(name: ABSettingsViewController.SettingsNotificationKey, object: nil)
        print("Font Button = \(ABSettingsViewController._fontButton)")
        print("\(ABSettingsViewController.SettingsNotificationKey)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
