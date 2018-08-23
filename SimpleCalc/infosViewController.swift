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
        testInternetAndWifiConnexion()
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
        composeVC.setMessageBody("Bonjour, <BR><BR> Toute l'équipe de SIMPLE CALC vous remercie encore d'avoir pris le temps de nous donner votre avis et vos commentaires. <BR>  <BR>Pour une meilleur gestion des demandes, veuillez SVP saisir les informations suivantes : <BR> - Votre type de matériel utilisé: iPhone ou iPad ?<BR> - Version d'iOS installée : <BR> <BR> Les points positifs que vous appréciez : <BR>-<BR>-<BR>-<BR><BR> Les améliorations que vous souhaiteriez voir: <BR>-<BR>-<BR>-<BR><BR>Si nécessaire, vous pouvez joindre des captures d'écrans avec des anotations.<BR> <BR>Merci pour votre soutien. <BR><BR>L’équipe de SIMPLE CALC<BR>", isHTML: true)
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    func testInternetAndWifiConnexion() {
        // check internet connexion
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alertController = UIAlertController.init(title: "Aucune Connexion Internet", message: "Veuillez vérifier votre connexion.\nActivez le Wifi ou les données mobiles.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_ ) in }))
//            alertController.addAction(UIAlertAction(title: "Activer le wifi", style: .cancel, handler: { (_ ) in
//                print("Activation Wifi")
//            }))
//            alertController.addAction(UIAlertAction(title: "Activer les données mobiles", style: .cancel, handler: { (_ ) in
//                print("Activation Données Mobiles")
//            }))
            present(alertController, animated: true, completion: nil) // completion : lancer du code une fois qu'il est afficher.
        }
        return
    }
    
    @IBAction func moreAppsButton(_ sender: Any) {
        moreAppsABERNARD (presentedViewController: self)
    }
    
    func moreAppsABERNARD (presentedViewController : UIViewController!) {
        let alertController = UIAlertController(title: "Voir nos applications", message: "Nous vous proposons de regarder nos autres applications sur l'AppStore ou sur notre site internet", preferredStyle: .actionSheet)
        
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
        
//        presentedViewController?.present(alertController, animated: true, completion: nil)
        present(alertController, animated: true, completion: nil)
        
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
