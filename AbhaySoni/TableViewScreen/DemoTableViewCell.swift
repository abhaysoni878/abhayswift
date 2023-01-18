//
//  DemoTableViewCell.swift
//  AbhaySoni
//
//  Created by bizbrolly on 30/11/21.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    //MARK: outlets
    
    @IBOutlet weak var dataContainVw: UIView!
    
    @IBOutlet weak var viewimage_view: UIView!
    @IBOutlet weak var image_image: UIImageView!
    
    @IBOutlet weak var label1_LBL: UILabel!
    
    
    @IBOutlet weak var label2_lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dataContainVw.layer.borderWidth = 1.0
        dataContainVw.layer.cornerRadius = dataContainVw.bounds.size.height/4
        self.layer.borderColor = UIColor(red: 108, green: 108, blue: 108, alpha: 0).cgColor
        
        
        //viewimage_view.layer.backgroundColor = UIColor.systemPink.cgColor
        viewimage_view.layer.cornerRadius = viewimage_view.bounds.size.height/2
        image_image.layer.cornerRadius = image_image.bounds.size.height/2
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
