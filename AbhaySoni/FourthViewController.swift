//
//  FourthViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 17/12/21.
//

import UIKit

class FourthViewController: UIViewController , UITextFieldDelegate {
    
    //MARK: outlets
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    @IBOutlet weak var textfield3: UITextField!
    
    @IBOutlet weak var textfield4: UITextField!
    
    @IBOutlet weak var resend_btn: UIButton!
    
    @IBOutlet weak var verify_btn: UIButton!
    
    @IBOutlet weak var left_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verify_btn.layer.cornerRadius = 25
        verify_btn.layer.masksToBounds = true
        textfield1.layer.borderWidth = 1.0
        textfield1.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        //textfield1.layer.masksToBounds = false
        textfield2.layer.borderWidth = 1.0
        textfield2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
       // textfield2.layer.masksToBounds = false
        textfield3.layer.borderWidth = 1.0
        textfield3.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
       // textfield3.layer.masksToBounds = false
        textfield4.layer.borderWidth = 1.0
        textfield4.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
       // textfield4.layer.masksToBounds = false
        //textfield1.layer.borderColor = UIColor(red: 237, green: 239, blue: 241, alpha: 1).cgColor
        //textfield2.layer.borderColor = UIColor(red: 237, green: 239, blue: 241, alpha: 1).cgColor
        //textfield3.layer.borderColor = UIColor(red: 237, green: 239, blue: 241, alpha: 1).cgColor
        //textfield4.layer.borderColor = UIColor(red: 237, green: 239, blue: 241, alpha: 1).cgColor
        textfield1.layer.cornerRadius = 15
        textfield2.layer.cornerRadius = 15
        textfield3.layer.cornerRadius = 15
        textfield4.layer.cornerRadius = 15
        
        textfield4.attributedPlaceholder = NSAttributedString (string: "-", attributes: [.foregroundColor:UIColor.black,.font: UIFont.boldSystemFont(ofSize: 18.0)])
        textfield3.attributedPlaceholder = NSAttributedString (string: "-", attributes: [.foregroundColor:UIColor.black,.font: UIFont.boldSystemFont(ofSize: 18.0)])
        textfield2.attributedPlaceholder = NSAttributedString (string: "-", attributes: [.foregroundColor:UIColor.black,.font: UIFont.boldSystemFont(ofSize: 18.0)])
        textfield1.attributedPlaceholder = NSAttributedString (string: "-", attributes: [.foregroundColor:UIColor.black,.font: UIFont.boldSystemFont(ofSize: 18.0)])
        resend_btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        resend_btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        self.textfield1.addTarget(self, action: #selector(self.changecharacter), for: .editingChanged)
        self.textfield2.addTarget(self, action: #selector(self.changecharacter), for: .editingChanged)
        self.textfield3.addTarget(self, action: #selector(self.changecharacter), for: .editingChanged)
        self.textfield4.addTarget(self, action: #selector(self.changecharacter), for: .editingChanged)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(KeyboardWillHide))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    @objc func KeyboardWillHide() {
        self.view.endEditing(true)
    }
    @objc func changecharacter (textField : UITextField)
    {
        if textField.text?.utf8.count == 1 {
            switch textField {
            case textfield1:
                textfield1.backgroundColor = #colorLiteral(red: 0.9693605304, green: 0.7432978749, blue: 0, alpha: 1)
                textfield1.layer.borderColor = UIColor.white.cgColor
                textfield1.layer.masksToBounds = true
                textfield2.becomeFirstResponder()
            case textfield2:
                textfield2.backgroundColor = #colorLiteral(red: 0.9693605304, green: 0.7432978749, blue: 0, alpha: 1)
                textfield2.layer.borderColor = UIColor.white.cgColor
                textfield2.layer.masksToBounds = true
                textfield3.becomeFirstResponder()
            case textfield3:
                textfield3.backgroundColor =  #colorLiteral(red: 0.9693605304, green: 0.7432978749, blue: 0, alpha: 1)
                textfield3.layer.borderColor = UIColor.white.cgColor
                textfield3.layer.masksToBounds = true
                textfield4.becomeFirstResponder()
            case textfield4:
                textfield4.backgroundColor =  #colorLiteral(red: 0.9693605304, green: 0.7432978749, blue: 0, alpha: 1)
                textfield4.layer.borderColor = UIColor.white.cgColor
                textfield4.layer.masksToBounds = true
                
                print ("OTP = \(textfield1.text!)\(textfield2.text!)\(textfield3.text!)\(textfield4.text!)")
            default:
                break
            }
        }
        else
        {
            if textField.text!.isEmpty
            {
                switch textField
                {
                case textfield4:
                    textfield4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    textfield4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    textfield4.layer.masksToBounds = true
                    textfield3.becomeFirstResponder()
                case textfield3:
                    textfield3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    textfield3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    textfield3.layer.masksToBounds = true
                    textfield2.becomeFirstResponder()
                case textfield2:
                    textfield2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    textfield2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    textfield2.layer.masksToBounds = true
                    textfield1.becomeFirstResponder()
                    textfield1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    textfield1.layer.masksToBounds = true
                default:
                    textfield1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    return
                }
            }
        }
    }
    
    @IBAction func verify_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController( vc, animated: true)
        self.view.endEditing(true)
    }
    
    @IBAction func left_btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.popViewController(animated: true)
    }

}
extension FourthViewController  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty {
            return false
        }
        else {
            return true
        }
    }
}
