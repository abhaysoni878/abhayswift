//
//  StopWatchTableViewCell.swift
//  AbhaySoni
//
//  Created by bizbrolly on 17/01/22.
//

import UIKit

class StopWatchTableViewCell: UITableViewCell {

    //MARK: variable
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
