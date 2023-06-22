//
//  TherdCollectionViewCell.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit

class TherdCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cell3NumLabel: UILabel!
    @IBOutlet var viewCell: UIView!
    @IBOutlet var priceView: UIView!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 10
        priceView.layer.cornerRadius = 10
        image.layer.cornerRadius = 10
    }

}
