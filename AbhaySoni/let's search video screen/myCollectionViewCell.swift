//
//  myCollectionViewCell.swift
//  AbhaySoni
//
//  Created by bizbrolly on 07/12/21.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var first_image: UIImageView!
    @IBOutlet weak var second_image: UIImageView!
    @IBOutlet weak var love_image: UIImageView!
    @IBOutlet weak var first_lbl: UILabel!
    @IBOutlet weak var second_lbl: UILabel!
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        self.first_image.layer.cornerRadius = 20.0
        self.first_image.layer.masksToBounds = true
        self.second_image.layer.cornerRadius = 10.0
        
//        layer.cornerRadius = 8.0
//        layer.masksToBounds = true
        
        
        }
        
}
