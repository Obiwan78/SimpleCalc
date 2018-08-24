//
//  moreApps.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 23/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class ABMoreAppsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
//    let _titleAlertController: String? = "Voir nos applications"
//    let _messageAlertController: String? = "Nous vous proposons de regarder nos autres applications sur l'AppStore ou sur notre site internet"
//    let _preferedStyleAlertController: UIAlertController.Type = .actionSheet
    let alertController = UIAlertController(title: "Voir nos applications", message: "Nous vous proposons de regarder nos autres applications sur l'AppStore ou sur notre site internet", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if !MFMailComposeViewController.canSendMail(){
            print("Mail Services are not available")
            return
        }
    }
    
    
    public func showAlertControllerMoreApps() {
        alertController.addAction(UIAlertAction( title: "Sur le site internet",
                                                style: .default,
                                                handler: {
                                                (action:UIAlertAction!) -> Void in
                                                UIApplication.shared.open(URL(string: "https://albanbernard.fr/ios-apps")! as URL, options: [:], completionHandler: nil)
    }))
    
    alertController.addAction(UIAlertAction(title: "Sur l'AppStore",
                                            style: .default,
                                            handler: { (_ ) in
                                                UIApplication.shared.open(URL(string: "https://itunes.apple.com/fr/app/le-nombre-secret/id1425470784")! as URL, options: [:], completionHandler: nil)
    }))
    
    alertController.addAction(UIAlertAction(title: "Fermer", style: .cancel, handler: nil))
    
    present(alertController, animated: true, completion: nil)
    
    }
    
}


