//
//  ViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 22/11/21.
//

import UIKit

class ViewController: UIViewController {
//mark: outlets
    @IBOutlet weak var Sign_btn: UIButton!
    
    @IBOutlet weak var SignUp_btn: UIButton!
    
    @IBOutlet weak var eye_Btn: UIButton!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
//MARK: variable
    var iconClick = true
    let imageicon = UIImageView ()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Sign_btn.layer.cornerRadius = 10
        Sign_btn.clipsToBounds = true
        Sign_btn.layer.cornerRadius = Sign_btn.bounds.size.height/2
        
        imageicon.image = UIImage(named: "")
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "chevron-left (1)")!.size.width, height: UIImage(named: "chevron-left (1)")!.size.height)
        imageicon.frame = CGRect(x: 0, y: 0, width: UIImage(named: "chevron-left (1)")!.size.width, height: UIImage(named: "chevron-left (1)")!.size.height)
        
        
    }
    
    @IBAction func sign_btn(_ sender: Any) {
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
        //self.navigationController?.pushViewController( vc, animated: true)
    }
    
    @IBAction func SignUp_btn(_ sender: Any) {
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
        //self.navigationController?.pushViewController( vc, animated: true)
    }
    @IBAction func eye_Btn(_ sender: AnyObject) {
        
        if(iconClick == true)
        {
            passwordTF.isSecureTextEntry = false
            eye_Btn.setImage(UIImage(named: "eye"), for: .normal)
        }
        else {
            eye_Btn.setImage(UIImage(named: "eye-off-outline"), for: .normal)
            passwordTF.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    
    
}
