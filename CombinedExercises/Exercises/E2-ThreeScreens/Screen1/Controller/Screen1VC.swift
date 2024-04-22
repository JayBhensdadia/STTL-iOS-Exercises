//
//  Screen1VC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class Screen1VC: UIViewController {

    //MARK: outlets
    
    @IBOutlet var txtName: UITextField!
    
    
    //MARK: lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.layer.cornerRadius = txtName.frame.height/2
        txtName.layer.masksToBounds = true
      
    }
    

    

}
