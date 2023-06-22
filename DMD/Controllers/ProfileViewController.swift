//
//  ViewController.swift
//  DMD
//
//  Created by  фф on 26.04.2021.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    var id: String = ""
    
    @IBOutlet var nickLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var sumAllOrdersLabel: UILabel!
    @IBOutlet var conversionLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        print("ЗАГРУЗКА ПРОФИЛЯ")
        let placeRef = Database.database().reference().child("users").child(id)
        
        backView.layer.cornerRadius = 15
        profileImage.layer.cornerRadius = 28
    
        placeRef.observeSingleEvent(of: .value) { (snapshot) in
            let idd = snapshot.value as! [String: Any]
            self.nickLabel.text! = idd["nickname"] as! String
            self.firstNameLabel.text! = idd["firstname"] as! String
            self.lastNameLabel.text! = idd["lastname"] as! String
            self.emailLabel.text! = idd["email"] as! String
            self.sumAllOrdersLabel.text! = "Сумма покупок: " + String(idd["summOfOrder"] as! Int)
        }
        
        conversionLabel.text! = "Ваша скидка: " + model.init().converionFunc(id: id) + " %"
        
    }

    @IBAction func backButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

