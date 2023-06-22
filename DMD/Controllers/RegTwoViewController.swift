//
//  RegTwoViewController.swift
//  DMD
//
//  Created by  фф on 03.05.2021.
//

import UIKit

class RegTwoViewController: UIViewController {
    
    var state: Bool = false
    
    var nick: String = ""
    var pass: String = ""

    @IBOutlet var backView: UIView!
    @IBOutlet var firstNameLabel: UITextField!
    @IBOutlet var secondNameLabel: UITextField!
    @IBOutlet var regButton: UIButton!
    @IBOutlet var dontButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.layer.cornerRadius = 15
        firstNameLabel.layer.cornerRadius = 25
        secondNameLabel.layer.cornerRadius = 25
        regButton.layer.cornerRadius = 7
        dontButton.layer.cornerRadius = 7
        
    }
    
    @IBAction func checkTap(_ sender: Any) {
        state = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MainViewController {
            if state == true{
                dest.nickName.append(nick)
                dest.passWord.append(pass)
                dest.firstName.append(firstNameLabel.text!)
                dest.lastName.append(secondNameLabel.text!)
                dest.countBalls.append(100)
            }
        }
    }
 
}
