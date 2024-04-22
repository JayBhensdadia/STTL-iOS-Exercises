//
//  UIViewController + Extension.swift
//  project
//
//  Created by Jay Bhensdadia on 11/04/24.
//


import Foundation
import UIKit

extension UIViewController{
    
    
    public func openMyAlert(title: String,
                            message: String,
                            alertStyle:UIAlertController.Style,
                            actionTitles:[String],
                            actionStyles:[UIAlertAction.Style],
                            actions: [((UIAlertAction) -> Void)]){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated: true)
    }
    
    
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
