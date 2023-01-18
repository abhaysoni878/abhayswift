//
//  SecondViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 16/12/21.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: outlets
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var signup_btn: UIButton!
    
    @IBOutlet weak var signin_btn: UIButton!
    
    @IBOutlet weak var left_btn: UIButton!
    
    @IBOutlet weak var text1Field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: ---- keyboard hide
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardhiding))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        //MARK: ------
        
        view1.layer.cornerRadius = 10
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOffset = .zero
        view1.layer.shadowOpacity = 1
        view1.layer.shadowRadius = 1
        
        signup_btn.layer.cornerRadius = 25
        signup_btn.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        //signin_btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0)
        //signin_btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        text1Field.attributedPlaceholder = NSAttributedString(string: "Enter Mobile Number", attributes: [.foregroundColor: UIColor.black,.font: UIFont.boldSystemFont(ofSize: 16.0)])
        signin_btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    @objc func keyboardhiding () {
        self.view.endEditing(true)
    }
    @IBAction func signup_btn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController( vc, animated: true)
        }

    
    @IBAction func left_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signin_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.view.endEditing(true)
    }
    
    
    
}
