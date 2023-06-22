//
//  FourthCollectionViewCell.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit

class FourthCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cell4NumLabel: UILabel!
    @IBOutlet var viewCell: UIView!
    @IBOutlet var priceView: UIView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageSoup: UIImageView!
    @IBOutlet var weightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 10
        priceView.layer.cornerRadius = 10
        imageSoup.layer.cornerRadius = 10
    }

}
