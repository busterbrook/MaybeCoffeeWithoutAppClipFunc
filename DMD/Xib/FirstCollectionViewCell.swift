//
//  FirstCollectionViewCell.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var priceView: UIView!
    @IBOutlet var Cell1BackView: UIView!
    @IBOutlet var Cell1NumLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var imageCoffe: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Cell1BackView.layer.cornerRadius = 10
        imageCoffe.layer.cornerRadius = 10
        priceView.layer.cornerRadius = 10
    }

}
