//
//  Screen2VC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class Screen2VC: UIViewController {
    
    
    //MARK: outlets
    @IBOutlet var bgView: UIView!
    @IBOutlet var btnRegister: UIButton!
    
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lightOrange = UIColor(red: 255/255, green: 204/255, blue: 153/255, alpha: 1.0).cgColor
        let systemOrange = UIColor.systemOrange.cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.bounds
        gradientLayer.colors = [lightOrange, systemOrange]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
        
        
        btnRegister.layer.borderWidth = 2
        btnRegister.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        btnRegister.layer.cornerRadius = 5
    }
    
    
    
    
}
