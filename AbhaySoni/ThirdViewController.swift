//
//  ThirdViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 16/12/21.
//

import UIKit

class ThirdViewController: UIViewController , UITextFieldDelegate {

    //MARK: outlets
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var sign_btn: UIButton!
    
    @IBOutlet weak var left_btn: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var text1Field: UITextField!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var text2Field: UITextField!
    
    @IBOutlet weak var sign_in: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: PLACEHOLDER TEXTFIELD BOLD
        text1Field.attributedPlaceholder = NSAttributedString(string: "Enter your Name", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 16.0)
        ])
        text2Field.attributedPlaceholder = NSAttributedString(string: "Enter Mobile Number", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 16.0)
        ])
        //MARK: SIGNIN ADD IMAGE AND TEXT MANAGE
        //sign_in.imageEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 6)
        //sign_in.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        //MARK: SIGNUP BUTTON
        sign_btn.layer.cornerRadius = 25
        
        
        
        
        view1.layer.cornerRadius = 10
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOffset = .zero
        view1.layer.shadowOpacity = 1
        view1.layer.shadowRadius = 1
        
        view2.layer.cornerRadius = 10
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOffset = .zero
        view2.layer.shadowOpacity = 1
        view2.layer.shadowRadius = 1
        
        
        
        
        
        text1Field.delegate = self
        text2Field.delegate = self
        //MARK: ------tapgesture
        self.hodeKeyboardTappedAround()
        
        
        

//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification), name: ThirdViewController.keyboardWillHideNotification, object: nil)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    var isExpand : Bool = false
        @objc func keyboardAppear(){
            if !isExpand {
                
                self.scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 100)
                isExpand = true
            }
        }
        @objc func keyboardDisappear(){
            if isExpand {
                self.scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
                isExpand = false
            }
        }
    
    
    
    
//    @objc func keyboardWillShowNotification(notification: Notification) {
//
//        guard let userinfo = notification.userInfo else
//        {
//            return
//        }
//        var keyboardframe: CGRect = (userinfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        keyboardframe = self.view.convert(keyboardframe, from: nil)
//        var contentinset: UIEdgeInsets = self.scroll.contentInset
//        contentinset.bottom = keyboardframe.size.height + 20
//        scroll.contentInset = contentinset
//    }
////        if let frame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
////            let height = frame.cgRectValue.height
////            if text2Field == text2Field
////            {
////                self.view.frame.origin.y = 20
////            }
////            else
////            {
////                self.view.frame.origin.y = 0
////            }
////        }
//    //}
//    @objc func keyboardWillHideNotification(notification : Notification){
//        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
//        scroll.contentInset = contentInset
//        //self.view.frame.origin.y = 0
//    }
    @IBAction func sign_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        self.navigationController?.pushViewController( vc, animated: true)
        self.view.endEditing(true)
        
    }
    
    @IBAction func signin_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController( vc, animated: true)
    }
    
    
    @IBAction func left_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:-------texfield move
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //self.text1Field.frame.origin.y = 0

        if text1Field == textField {
            text2Field.becomeFirstResponder()
        }
        if text2Field == textField {
            text2Field.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
     
    }
    func hodeKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
