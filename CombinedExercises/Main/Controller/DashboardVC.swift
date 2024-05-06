//
//  DashboardVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 23/04/24.
//

import UIKit
import SideMenu

class DashboardVC: UIViewController {

    @IBOutlet var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        bgView.layer.cornerRadius = 20
        bgView.layer.masksToBounds = true
        
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowOffset = CGSize(width: 0, height: 4)
        bgView.layer.shadowRadius = 4
        bgView.layer.masksToBounds = false
    }
    

    
    
    
    
    @IBAction func btnShowSidemenuAction(_ sender: Any) {
        
        if let menuLeftNavigationController = SideMenuManager.default.leftMenuNavigationController {
            if menuLeftNavigationController.presentingViewController != nil {
                menuLeftNavigationController.dismiss(animated: false) {
                    self.present(menuLeftNavigationController, animated: true, completion: nil)
                }
            } else {
                self.present(menuLeftNavigationController, animated: true, completion: nil)
            }
        }
    }
    
}
