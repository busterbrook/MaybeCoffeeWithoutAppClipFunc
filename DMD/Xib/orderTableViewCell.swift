//
//  orderTableViewCell.swift
//  DMD
//
//  Created by  фф on 30.04.2021.
//

import UIKit

class orderTableViewCell: UITableViewCell {

    var count: Int = 1
    @IBOutlet var imageTovar: UIImageView!
    @IBOutlet var nameTovar: UILabel!
    @IBOutlet var priceTovar: UILabel!
    @IBOutlet var countTovar: UILabel!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageTovar.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        countTovar.text! = String(count)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func plusTovarButton(_ sender: Any) {
        countTovar.text! = String(Int(countTovar.text!)! + 1)
    }
    @IBAction func minusTovarButton(_ sender: Any) {
        if Int(countTovar.text!)! - 1 > 0{
            countTovar.text! = String(Int(countTovar.text!)! - 1)
        }
    }
}



