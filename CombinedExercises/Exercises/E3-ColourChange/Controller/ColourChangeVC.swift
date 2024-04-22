//
//  ColourChangeVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class ColourChangeVC: UIViewController {

    //MARK: Outlets
    @IBOutlet var bgView: UIView!
    
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnCoolAction(_ sender: Any) {
        bgView.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func btnWarmAction(_ sender: Any) {
        bgView.backgroundColor = UIColor.systemYellow
    }
}
