//
//  ImageTableViewCell.swift
//  AbhaySoni
//
//  Created by bizbrolly on 24/01/22.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    //MARK:- outlets
    
    @IBOutlet weak var apiimage: UIImageView!
    
    @IBOutlet weak var apiname: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.apiimage.layer.cornerRadius = 20
        self.apiimage.layer.borderWidth = 2.0
        self.apiimage.layer.borderColor = UIColor.black.cgColor
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
