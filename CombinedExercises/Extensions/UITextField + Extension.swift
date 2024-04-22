//
//  UITextField + Extension.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit


extension UITextField{
    
    
    func addPadding(){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


