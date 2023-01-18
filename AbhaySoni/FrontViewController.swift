//
//  FrontViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 16/12/21.
//

import UIKit

class FrontViewController: UIViewController {
    
    //MARK: outlets
    
    @IBOutlet weak var current_page: UIPageControl!
    
    @IBOutlet weak var welcome_Btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcome_Btn.layer.cornerRadius = 15
        welcome_Btn.layer.maskedCorners = [.layerMinXMinYCorner , .layerMinXMaxYCorner]
        welcome_Btn.layer.masksToBounds = true
        
        current_page.currentPage = 0
        //current_page.currentPageIndicatorTintColor = UIColor.yellow
//            current_page.setIndicatorImage(<#T##image: UIImage?##UIImage?#>, forPage: <#T##Int#>)
//        if current_page.currentPage == 0
//        {
//            current_page.transform = CGAffineTransform(scaleX: 1.9, y: 1)
//        }
//        else
//        {
//            current_page.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }
//
        
        current_page.pageIndicatorTintColor = UIColor.gray
        current_page.currentPageIndicatorTintColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    
    @IBAction func welcome_Btn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @IBAction func skip_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
