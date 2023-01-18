//
//  FirstViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 16/12/21.
//

import UIKit

class FirstViewController: UIViewController {

    //MARK: outlets
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit_btn.layer.cornerRadius = 15
        submit_btn.layer.maskedCorners = [.layerMinXMinYCorner , .layerMinXMaxYCorner]
        submit_btn.layer.masksToBounds = true
        pagecontrol.currentPage = 1
        pagecontrol.currentPageIndicatorTintColor = UIColor.black
        pagecontrol.pageIndicatorTintColor = UIColor.gray
        
//        if pagecontrol.currentPage == 0
//        {
//            pagecontrol.transform = CGAffineTransform(scaleX: 1.9, y: 1)
//        }
//        else
//        {
//            pagecontrol.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }
        
    }
    
    @IBAction func Submit_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func skip_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
