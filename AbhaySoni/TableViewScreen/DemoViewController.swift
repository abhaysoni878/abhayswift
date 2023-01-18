//
//  DemoViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 30/11/21.
//

import UIKit

class DemoViewController: UIViewController {
    
    //MARK: outlets
    
    @IBOutlet weak var table_view: UITableView!
    
    //MARK: variables
    var imagecolor = [ #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.8941176471, alpha: 1) , #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.8941176471, alpha: 1) , #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.8941176471, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.8941176471, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
    var color = [ #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 0.9277076125, green: 0.9308245778, blue: 0.9277976155, alpha: 1) , #colorLiteral(red: 0.9277076125, green: 0.9308245778, blue: 0.9277976155, alpha: 1) , #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.8941176471, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    var imageset = [ #imageLiteral(resourceName: "images") , #imageLiteral(resourceName: "download (5)") , #imageLiteral(resourceName: "MicrosoftTeams-image (46)") , #imageLiteral(resourceName: "cotact"), #imageLiteral(resourceName: "download (6)"), #imageLiteral(resourceName: "swami-vivekananda-inspire-wallpapers-download-21v1") , #imageLiteral(resourceName: "download (6)"), #imageLiteral(resourceName: "download (5)")]
    var label1 : [String] = [" your document has been approved successfully."," your withdrawn request is submitted." , " Booking is cancelled "," You have successfully accepted the appointment request by ."," is with P. Chidambran at 7:10 pm on wednesday", " Booking is cancelled "," You have successfully accepted the appointment request by ."," is with P. Chidambran at 7:10 pm on wednesday"]
    var attribute = ["Congratulation,","Congratulation,","Oops,","XYZ","Your Next Booking,","Oops,","XYZ","Your Next Booking,"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    //MARK:- API INTEGRATION
    
    
    
    
}
extension DemoViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.image_image.image = imageset[indexPath.row]
        
        
        let boldText = attribute[indexPath.row]
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = label1[indexPath.row]
        let normalString = NSMutableAttributedString(string:normalText)
        
        if !(indexPath.row == 3)
        {
            attributedString.append(normalString)
            cell.label1_LBL.attributedText = attributedString
        }
        else
        {
            normalString.append(attributedString)
            cell.label1_LBL.attributedText = normalString
        }
        cell.dataContainVw.backgroundColor = color[indexPath.row]
        cell.viewimage_view.backgroundColor = imagecolor[indexPath.row]
        return cell
    }
    
}

