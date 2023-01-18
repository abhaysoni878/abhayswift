//
//  ScrollViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 02/12/21.
//

import UIKit

class ScrollViewController: UIViewController , UITextFieldDelegate, UITextViewDelegate {
    
    //MARK: outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var abhay_txt: UITextField!
    @IBOutlet weak var email_txt: UITextField!
    @IBOutlet weak var mobilenum_txt: UITextField!
    @IBOutlet weak var upload_txt: UITextField!
    
    @IBOutlet weak var message_txt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnClick.layer.cornerRadius = btnClick.bounds.size.height/2
        abhay_txt.delegate = self
        email_txt.delegate = self
        mobilenum_txt.delegate = self
        upload_txt.delegate = self
        message_txt.text = "Your message goes here"
        message_txt.textColor = UIColor.lightGray
        
        self.hodeKeyboardTappedAround()
         //Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    //MARK: Actions
    @IBAction func btnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController( vc, animated: true)
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        if abhay_txt == textField {
            email_txt.becomeFirstResponder()
        }
        if email_txt == textField {
            mobilenum_txt.becomeFirstResponder()
        }
        if mobilenum_txt == textField {
            upload_txt.becomeFirstResponder()
        }
        if upload_txt == textField {
            message_txt.becomeFirstResponder()
        }
        return true
    }
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        if message_txt == textView {
            message_txt.resignFirstResponder()
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if message_txt.textColor == UIColor.lightGray {
            message_txt.text = nil
            message_txt.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if message_txt.text.isEmpty {
            message_txt.text = "Your message goes here"
            message_txt.textColor = UIColor.lightGray
        }
    }

    
    
    
//    var isExpand : Bool = false
    //    @objc func keyboardAppear(){
    //        print ("Call")
    //        if !isExpand {
    //            print("call = EXECUTE")
    //            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    //            isExpand = true
    //        }
    //    }
    //    @objc func keyboardDisappear(){
    //        //print ("Call")
    //        if isExpand {
    //            print("call = EXECUTE")
    //            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    //            isExpand = false
    //        }
    //    }
    
    
    
    
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 100
        scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
extension ScrollViewController {
    func hodeKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ScrollViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
