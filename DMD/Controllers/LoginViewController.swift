//
//  LoginViewController.swift
//  DMD
//
//  Created by  фф on 26.04.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var res: Int = -1

    @IBOutlet var BackView: UIView!
    @IBOutlet var NickTextField: UITextField!
    @IBOutlet var PasTextField: UITextField!
    @IBOutlet var LogButton: UIButton!
    @IBOutlet var EscapeLogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NickTextField.delegate = self
        PasTextField.delegate = self
        
        BackView.layer.cornerRadius = 15
        NickTextField.layer.cornerRadius = 25
        PasTextField.layer.cornerRadius = 25
        LogButton.layer.cornerRadius = 7
        EscapeLogButton.layer.cornerRadius = 7
        
    }
    
    @IBAction func checkLog(_ sender: Any) {
        res = model.init().checkLogIn(nicknameArr: MainViewController.init().nickName, passwordArr: MainViewController.init().passWord, nick: NickTextField.text!, pass: PasTextField.text!)
        print(res)
        if res == 2 {
            performSegue(withIdentifier: "toMainMenu", sender: self)
        }else{
            print("enter error")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NickTextField.resignFirstResponder()
        PasTextField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MainViewController {
            if res == 2{
                //dest.tagProfile = model.init().takeTagOfUser(nickArr: MainViewController.init()., nick: NickTextField.text!)
                print("gg")
            }
        }
    }
}
