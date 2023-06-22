//
//  LogRegDBViewController.swift
//  DMD
//
//  Created by  фф on 10.05.2021.
//

import UIKit
import Firebase

class LogRegDBViewController: UIViewController, UITextFieldDelegate {

    var id: String = ""
    var res: Int = 0
    
    var signup:Bool = true{
        willSet{
            if newValue{
                titleLabel.text = "Регистрация"
                nicknameField.isHidden = false
                firstnameField.isHidden = false
                lastnameField.isHidden = false
                enterButton.setTitle("Войти", for: .normal)
                GoInsideButton.setTitle("Регистрация", for: .normal)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                    var button = self.GoInsideButton.frame
                    button.origin.y += 160
                    self.GoInsideButton.frame = button
                } completion: { finished in
                    print("кнопка поднялась")
                }
                dopTitle.text = "Уже есть аккаунт?"
            }else{
                titleLabel.text = "Вход"
                nicknameField.isHidden = true
                firstnameField.isHidden = true
                lastnameField.isHidden = true
                enterButton.setTitle("Регистрация", for: .normal)
                GoInsideButton.setTitle("Войти", for: .normal)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                    var button = self.GoInsideButton.frame
                    button.origin.y -= 160
                    self.GoInsideButton.frame = button
                } completion: { finished in
                    print("кнопка поднялась")
                }
                dopTitle.text = "Все еще нет аккаунта?"
            }
        }
    }
    
    @IBOutlet var backView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var nicknameField: UITextField!
    @IBOutlet var firstnameField: UITextField!
    @IBOutlet var lastnameField: UITextField!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var GoInsideButton: UIButton!
    @IBOutlet var dopTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.layer.cornerRadius = 17
        emailField.layer.cornerRadius = 23
        emailField.delegate = self
        passwordField.layer.cornerRadius = 23
        passwordField.delegate = self
        nicknameField.layer.cornerRadius = 23
        nicknameField.delegate = self
        firstnameField.layer.cornerRadius = 23
        firstnameField.delegate = self
        lastnameField.layer.cornerRadius = 23
        lastnameField.delegate = self
        GoInsideButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func switchLogin(_ sender: UIButton) {
        signup = !signup
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func goToMain(_ sender: UIButton) {
        
        let nickname = nicknameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        let firstname = firstnameField.text!
        let lastname = lastnameField.text!
        
        
        if(signup){
            if(!nickname.isEmpty && !email.isEmpty && !password.isEmpty && !firstname.isEmpty && !lastname.isEmpty){
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil{
                        if let result = result{
                            self.res = 1
                            self.id = result.user.uid
                            let ref = Database.database().reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["nickname": nickname, "email":email,"firstname":firstname,"lastname":lastname,"summOfOrder":0])
                            self.performSegue(withIdentifier: "goToMain", sender: self)
                            print("регистрация прошла успешно")
                        }
                    }
                }
            }else{
                showAlert()
            }
        }else{
            if(!email.isEmpty && !password.isEmpty){
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error == nil{
                        self.res = 2
                        self.id = result!.user.uid
                        self.performSegue(withIdentifier: "goToMain", sender: self)
                        print("успех")
                    }
                }
            }else{
                showAlert()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MainViewController {
            if res == 0{
                print("ошибка")
            }else if res == 1{
                dest.tid = self.id
                print("Регистрация")
            }else if res == 2{
                dest.tid = self.id
                print("вход")
            }
        }
    }
}
