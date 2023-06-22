//
//  SecondCollectionViewCell.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet var NumLabelCell2: UILabel!
    @IBOutlet var cell2BackView: UIView!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageFastfood: UIImageView!
    @IBOutlet var priceView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cell2BackView.layer.cornerRadius = 10
        priceView.layer.cornerRadius = 10
        imageFastfood.layer.cornerRadius = 10
    }

}
