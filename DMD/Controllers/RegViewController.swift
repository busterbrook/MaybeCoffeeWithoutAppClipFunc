import UIKit

class RegViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var NiknameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pasTextField: UITextField!
    @IBOutlet var RegButton: UIButton!
    @IBOutlet var escButton: UIButton!
    @IBOutlet var backView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NiknameTextField.delegate = self
        emailTextField.delegate = self
        pasTextField.delegate = self
        
        backView.layer.cornerRadius = 15
        NiknameTextField.layer.cornerRadius = 25
        emailTextField.layer.cornerRadius = 25
        pasTextField.layer.cornerRadius = 25
        RegButton.layer.cornerRadius = 7
        escButton.layer.cornerRadius = 7
        
    }
    /*
    @IBAction func regNweUser(_ sender: Any) {
        let res = model.init().regNewUser(nick: NiknameTextField.text!, pass: pasTextField.text!)
        if res == true{
            print("New user added")
            performSegue(withIdentifier: "toMainMenu1", sender: self)
            print(NiknameTextField.text!)
            print(pasTextField.text!)
        }else{
            print("Add error")
        }
    }
 */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? RegTwoViewController {
            dest.nick = NiknameTextField.text!
            dest.pass = pasTextField.text!
        }
    }
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NiknameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        pasTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func backToLog(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
