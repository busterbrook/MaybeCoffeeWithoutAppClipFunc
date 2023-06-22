//
//  PayViewController.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit
import Firebase
/*
protocol PayViewControllerDelegate: class {
    func update(text: String)
}
*/
class PayViewController: UIViewController{
    
    weak var delegate: OrderViewControllerDelegate?
    
    var endSum: Int = 0
    var conversion: Int = 0
    var emptyArr: [Int] = []
    
    @IBOutlet var PayMainView: UIView!
    @IBOutlet var payButton: UIButton!
    @IBOutlet var endSumLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var ballLabel: UILabel!
    @IBOutlet var applePayImage: UIImageView!
    @IBOutlet var payButtonView: UIView!
    @IBOutlet var viewAddress: UIView!
    @IBOutlet var activity: UIActivityIndicatorView!
    //@IBOutlet var helpButton: UIButton!
    
    var address: String = "Пушкинская 19"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ОПЛАТА")
        
        activity.hidesWhenStopped = true
        
        addressLabel.text = address
        
        PayMainView.layer.cornerRadius = 15
        payButton.layer.cornerRadius = 10
        viewAddress.layer.cornerRadius = 7
        
        ballLabel.text! = String(conversion) + " %"
        endSumLabel.text! = String(endSum - ((endSum/100) * conversion)) + " Р"
        
    }
    /*
    @IBAction func helpShow(_ unwindSegue: UIStoryboardSegue){
        /*
        guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") else {return}
        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.helpButton
        popOverVC?.sourceRect = CGRect(x: self.helpButton.bounds.minX, y: self.helpButton.bounds.maxY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        self.present(popVC, animated: true)
        */
        guard unwindSegue.identifier == "addressSegue" else {
                    return
                }
                guard let source = unwindSegue.source as? HelpTableViewController else { return }
        addressLabel.text = source.text
    }
*/
    @IBAction func pay(_ sender: Any){
        OrderViewController.init().tagColOrderArr.removeAll()
        applePayImage.isHidden = true
        payButtonView.isHidden = false
        activity.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [self] (t) in
            activity.hidesWhenStopped = true
            payButtonView.isHidden = true
            applePayImage.isHidden = false
            self.applePayImage.image = UIImage(named: "checkicon")
            delegate?.update(arr: emptyArr)
        }
        
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { (t) in
            self.dismiss(animated: true)
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? HelpTableViewController else { return }
            destination.delegate = self
        }
    func update(text: String) {
        addressLabel!.text = text
        print(text)
    }
 */
}
/*
extension PayViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return.none
    }
}
*/
