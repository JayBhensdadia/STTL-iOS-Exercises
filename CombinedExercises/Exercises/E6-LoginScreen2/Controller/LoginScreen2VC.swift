//
//  LoginScreen2VC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class LoginScreen2VC: UIViewController,UITextFieldDelegate {
    
    
    //MARK: outlets
    @IBOutlet var btnRememberMe: UIButton!
    
    @IBOutlet var btnSignup: UIButton!
    
    @IBOutlet var labelOr: UILabel!
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var txtEmail: UITextField!
    
    
    @IBOutlet var txtPassword: UITextField!
    
    
    @IBOutlet var txtOtp: UITextField!
    
    
    //MARK: variables
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.black,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ] // .double.rawValue, .thick.rawValue
    
    
    //MARK: lifecycle methods
    override func viewWillAppear(_ animated: Bool) {
        
        txtEmail.keyboardType = .emailAddress
        txtOtp.keyboardType = .decimalPad
        
        txtEmail.text = UserDefaults.standard.string(forKey: "email") ?? ""
        txtPassword.text = UserDefaults.standard.string(forKey: "password") ?? ""
        txtPassword.isSecureTextEntry = true

        txtOtp.text = ""
        
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        self.txtOtp.delegate = self
        
        hideKeyboardWhenTappedAround()
    }
    
    
    //validation methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail{
            txtPassword.becomeFirstResponder()
        }else if textField == txtPassword{
            txtOtp.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtOtp{
            // Define a character set containing only numeric characters
            let allowedCharacters = CharacterSet(charactersIn: "0123456789")
            // Check if the replacement string contains only allowed characters
            let characterSet = CharacterSet(charactersIn: string)
            // Check if the resulting string after replacement would have exactly 4 digits
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            return characterSet.isSubset(of: allowedCharacters) && newText.count <= 4
        }
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelOr.layer.borderWidth = 1
        labelOr.layer.borderColor = UIColor.systemGray.cgColor
        labelOr.layer.cornerRadius = 5
        
        
        let attributeString = NSMutableAttributedString(
            string: "SIGNUP",
            attributes: yourAttributes
        )
        
        btnSignup.setAttributedTitle(attributeString, for: .normal)
    }
    
    
    //MARK: Actions
    @IBAction func btnEyeAction(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text {
            
            if !email.validateEmailId(){
                
                openMyAlert(title: "Alert", message: "Invalid Email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
                
            }else if !password.validatePassword(){
                
                openMyAlert(title: "Alert", message: "Invalid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
                
            }else{
                
                
                if btnRememberMe.isSelected {
                    UserDefaults.standard.setValue(txtEmail.text, forKey: "email")
                    UserDefaults.standard.setValue(txtPassword.text, forKey: "password")
                }
                
                
                let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Dashboard") as! DashboardVC
//                vc.email = txtEmail.text
//                vc.password = txtPassword.text
                
                navigationController?.pushViewController(vc, animated: true)
                
                
            }
            
        }else{
            
            openMyAlert(title: "Alert", message: "Please provide credentials", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
            
        }
    }
    
    @IBAction func btnRememberMeAction(_ sender: Any) {
        btnRememberMe.isSelected.toggle()
    }
    
    
    
}
