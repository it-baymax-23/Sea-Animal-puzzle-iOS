//
//  ImageCollectionViewCell.swift
//  SeaAnimals
//
//  Created by UUU on 10/19/19.
//  Copyright © 2019 UUU. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var puzzleImage: UIImageView!
    
    override func awakeFromNib() {
        puzzleImage.frame = self.frame
    }
}
