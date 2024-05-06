//
//  CustomTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 16/04/24.
//

import UIKit

class CustomTVC: UITableViewCell {

    
    //MARK: outlets
    @IBOutlet var viewLogo: UIView!
    
    @IBOutlet var lblName: UILabel!
    
    
    @IBOutlet var lblId: UILabel!
    
    @IBOutlet var lblLogo: UILabel!
    
    @IBOutlet var lblMark: UILabel!
    
    
    //MARK: lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.viewLogo.layer.borderWidth = 1
            self.viewLogo.layer.borderColor = UIColor.systemRed.cgColor
            self.viewLogo.layer.masksToBounds = true
            self.viewLogo.layer.cornerRadius = self.viewLogo.frame.height / 2
        })
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
        
//        viewLogo.layer.backgroundColor = UIColor.blue.cgColor
        
        
    }
    
    
    //MARK: custom methods
    func configCell(data : StudentModel){
        lblMark.text = data.department
        lblName.text = data.name
        lblId.text = data.dob
        lblLogo.text = String(data.name[data.name.startIndex])
//        print(data.img)
    }
    
}
