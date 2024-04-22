//
//  NewsOnAirVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class NewsOnAirVC: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    
    // MARK: outlets
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var viewLoginForm: UIView!
    
    
    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var viewPassword: UIStackView!
    
    @IBOutlet var txtPassword: UITextField!
    
    
    @IBOutlet var btnSignIn: UIButton!
    
    
    @IBOutlet var btnSignIn2: UIButton!
    
    
    @IBOutlet var btnRememberMe: UIButton!
    
    
    @IBOutlet var btnEye: UIButton!
    
    
    
    // MARK: lifecycle methods
    
    override func viewWillAppear(_ animated: Bool) {
        
        txtEmail.keyboardType = .emailAddress
        
        
        txtEmail.text = UserDefaults.standard.string(forKey: "NOAEmail")
        txtPassword.text = UserDefaults.standard.string(forKey: "NOAPassword")
        
        
        viewLoginForm.layer.cornerRadius = 15
        txtEmail.layer.borderWidth = 2
        txtEmail.layer.borderColor = UIColor.systemGray3.cgColor
        txtEmail.layer.cornerRadius = 15
        
        
        viewPassword.layer.borderWidth = 2
        viewPassword.layer.borderColor = UIColor.systemGray3.cgColor
        viewPassword.layer.cornerRadius = 15
        
        
        btnSignIn.layer.cornerRadius = 15
        btnSignIn2.layer.cornerRadius = 15
        
        txtEmail.addPadding()
        txtPassword.addPadding()
        txtPassword.isSecureTextEntry = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        hideKeyboardWhenTappedAround()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // MARK: actions
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    
    @IBAction func btnSignInAction(_ sender: Any) {
        
        
        
        if let email = txtEmail.text, let password = txtPassword.text {
            
            if email.isEmpty {
                openMyAlert(title: "Alert", message: "Please Enter Email!!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
            }
            
            if password.isEmpty {
                openMyAlert(title: "Alert", message: "Please Enter Password!!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
            }
            
            
            if !email.validateEmailId(){
                
                openMyAlert(title: "Alert", message: "Invalid Email!!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
                
                scrollView.setContentOffset(CGPoint(x: txtEmail.frame.minX, y: txtEmail.frame.minY), animated: true)
                
            }else if !password.validatePassword(){
                
                openMyAlert(title: "Alert", message: "Invalid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
                
                scrollView.setContentOffset(CGPoint(x: txtPassword.frame.minX, y: txtPassword.frame.minY), animated: true)
                
            }else{
                
                
                if btnRememberMe.isSelected {
                    UserDefaults.standard.setValue(txtEmail.text, forKey: "NOAEmail")
                    UserDefaults.standard.setValue(txtPassword.text, forKey: "NOAPassword")
                }
                
                
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                vc.email = txtEmail.text
                vc.password = txtPassword.text
                
                navigationController?.pushViewController(vc, animated: true)
                
                
            }
            
        }else{
            
            openMyAlert(title: "Alert", message: "Please provide credentials", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay cliked!!")}])
            
        }
        
        
    }
    
    @IBAction func btnRememberMe(_ sender: Any) {
        btnRememberMe.isSelected.toggle()
        
    }
    
    
    @IBAction func btnEyeAction(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
        btnEye.isSelected.toggle()
        
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset = CGPoint(x: 0, y: min(scrollView.contentOffset.y, 0))
    }
    
    deinit {
        // Unregister keyboard notifications when the view controller is deallocated
        NotificationCenter.default.removeObserver(self)
    }
    
}
