//
//  Screen3VC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class Screen3VC: UIViewController {

    
    //MARK: outlets
    @IBOutlet var btnCreateAccount: UIButton!
    @IBOutlet var btnLogin: UIStackView!
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLogin.layer.cornerRadius = 15
        btnCreateAccount.layer.cornerRadius = 15
        btnLogin.layer.masksToBounds = true
        btnCreateAccount.layer.masksToBounds = true
    }
    

    

}
