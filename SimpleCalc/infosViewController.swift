//
//  infosViewController.swift
//  SimpleCalc
//
//  Created by Alban BERNARD on 19/08/2018.
//  Copyright © 2018 AB Production :). All rights reserved.
//

import UIKit
import MessageUI

class infosViewController: UIViewController, MFMailComposeViewControllerDelegate {

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
    
    @IBOutlet weak var sendEmailButton: UIButton!
    
    @IBAction func SendEmailButton(_ sender: Any) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients(["contact@albanbernard.fr"])
        composeVC.setSubject("Simple Calc")
        composeVC.setMessageBody("Bonjour, <BR><BR> Toute l'équipe de SIMPLE CALC vous remercie encore d'avoir pris le temps de prendre 2 minutes pour nous donner votre avis et vos commentaires. <BR>Nous tenons déjà à vous en remercier.<BR>  <BR>Pour une meilleur gestion des demandes, veuillez SVP saisir les informations suivantes : <BR> - votre type de matériel utilisé: iPhone ou iPad ?<BR> - version d'iOS installée : <BR> <BR> Les points positifs que vous appréciéez : <BR>-<BR>-<BR>-<BR><BR> Les améliorations que vous souhaiteriez voir: <BR>-<BR>-<BR>-<BR><BR>Si nécessaire, vous pouvez joindre des captures d'écrans avec anotations.<BR> <BR>Merci pour votre soutien. <BR><BR>L’équipe de SIMPLE CALC<BR>", isHTML: true)
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
