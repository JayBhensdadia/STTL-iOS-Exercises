//
//  LoginScreenVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class LoginScreenVC: UIViewController {

    //MARK: outlets
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var btnEye: UIButton!
    
    //MARK: lifecycle methods
    override func viewWillAppear(_ animated: Bool) {
        txtEmail.keyboardType = .emailAddress
        txtPassword.isSecureTextEntry = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func btnEyeAction(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()

    }
    
}
