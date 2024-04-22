//
//  HomeVC.swift
//  project
//
//  Created by Jay Bhensdadia on 10/04/24.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: variables
    var email:String?
    var password:String?
    
    
    //MARK: Outlets
    @IBOutlet var labelPassword: UILabel!
    @IBOutlet var labelEmail: UILabel!
    
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        labelEmail.text = email
        labelPassword.text = password
    }
    

    @IBAction func btnLogoutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "NOAEmail")
        UserDefaults.standard.removeObject(forKey: "NOAPassword")
        
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        
        navigationController?.popViewController(animated: true)
    }
    
    

}
