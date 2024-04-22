//
//  SectionedTVCell.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 17/04/24.
//

import UIKit

class SectionedTVCell: UITableViewCell {

    
    //MARK: outlets
    @IBOutlet var viewLogo: UIView!
    
    @IBOutlet var imgLogo: UIImageView!
    
   
    @IBOutlet var lblDob: UILabel!
    
    @IBOutlet var lblName: UILabel!
    
    
    @IBOutlet var lblDepartment: UILabel!
    
    
    //MARK: lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        viewLogo.layer.borderWidth = 1
        viewLogo.layer.borderColor = UIColor.systemRed.cgColor
        viewLogo.layer.masksToBounds = true
        viewLogo.layer.cornerRadius = viewLogo.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    //MARK: Custom methods
    func configCell(data : StudentModel){
        lblDepartment.text = data.department
        lblName.text = data.name
        lblDob.text = data.dob
        
        
       
        
        if let imgStr = data.img{
            if let urlStr = URL(string: imgStr){
                imgLogo.load(url:urlStr)
            }
            
        }
        
//        print(data.img)
    }
    
}
