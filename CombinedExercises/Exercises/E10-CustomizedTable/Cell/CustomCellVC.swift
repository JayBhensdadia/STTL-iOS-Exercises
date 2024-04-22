//
//  CustomCellVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 16/04/24.
//

import UIKit

class CustomCellVC: UITableViewCell {

    
    //MARK: outlets
    @IBOutlet var viewLogo: UIView!
    
    
    @IBOutlet var txtLogo: UILabel!
    
    
    @IBOutlet var txtDepartment: UILabel!
    
    @IBOutlet var txtDate: UILabel!
    
    @IBOutlet var txtName: UILabel!
    
    
    //MARK: lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewLogo.layer.borderWidth = 1
        viewLogo.layer.borderColor = UIColor.red.cgColor
        viewLogo.layer.cornerRadius = 50
        viewLogo.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
