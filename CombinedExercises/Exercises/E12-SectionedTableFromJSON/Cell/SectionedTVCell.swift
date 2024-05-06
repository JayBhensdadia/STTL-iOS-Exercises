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
//        viewLogo.layer.borderWidth = 1
//        viewLogo.layer.borderColor = UIColor.systemRed.cgColor
//        viewLogo.layer.masksToBounds = true
//        viewLogo.layer.cornerRadius = viewLogo.frame.height / 2
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.viewLogo.layer.cornerRadius = self.viewLogo.frame.height/2
            self.viewLogo.layer.borderWidth = 1
            self.viewLogo.layer.borderColor = UIColor.red.cgColor
            self.viewLogo.layer.masksToBounds = true
        })
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
