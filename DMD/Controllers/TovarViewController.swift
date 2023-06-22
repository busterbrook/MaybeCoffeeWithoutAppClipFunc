//
//  TovarViewController.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit

class TovarViewController: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?
    
    var countProduct: Int = 1
    var tagCollection: Int = 0
    var tagProduct: Int = 0
    
    var productArr: [String] = []
    
    @IBOutlet var tovarImage: UIImageView!
    @IBOutlet var MainButton: UIButton!
    @IBOutlet var aboutTovarLabe: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var backPlusMinView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var massaTovaraLabel: UILabel!
    @IBOutlet var pricePerOneTovarLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutTovarLabe.sizeToFit()
        
        productArr = model.init().createProduct(tagCollection: tagCollection, tagProduct: tagProduct)
        
        switch tagCollection {
        case 1:
            tovarImage.image =  model.init().imageCoffee[tagProduct]
        case 2:
            tovarImage.image = model.init().imageFastfood[tagProduct]
        case 3:
            tovarImage.image = model.init().imageSweat[tagProduct]
        case 4:
            tovarImage.image = model.init().imageSoup[tagProduct]
        default:
            print("errorTovarController")
        }
        
        nameLabel.text! = productArr[0]
        pricePerOneTovarLabel.text! = productArr[1] + "Р"
        massaTovaraLabel.text! = productArr[2] + " г"
        aboutTovarLabe.text! = productArr[3]
        
        backPlusMinView.layer.cornerRadius = 10
        MainButton.layer.cornerRadius = 10
        countLabel.text! = String(countProduct)
        
    }
    
    @IBAction func plusButtonFunc(_ sender: Any) {
        countProduct += 1
        countLabel.text! = String(countProduct)
    }
    
    @IBAction func minusButtonFunc(_ sender: Any) {
        if countProduct - 1 > 0{
            countProduct -= 1
            countLabel.text! = String(countProduct)
        }
    }
    
    @IBAction func sendToTableButton(_ sender: Any) {
        self.dismiss(animated: true)
        delegate?.update(tagCol: tagCollection, tagPro: tagProduct, countPro: countProduct)
    }
   
}
