//
//  ComplexCVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//

import UIKit

class ComplexCVC: UICollectionViewCell {
    
    //MARK: outlets
    @IBOutlet var viewShadow: UIView!
    @IBOutlet var viewBg: UIView!
    
    @IBOutlet var lblName: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    
    //MARK: lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBg.layer.cornerRadius = 20
        viewBg.layer.masksToBounds = true
        
        
        viewShadow.layer.cornerRadius = 20
        viewShadow.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
             self.layer.shadowOpacity = 0.3
             self.layer.shadowOffset = CGSize(width: 0, height: 4)
             self.layer.shadowRadius = 4
             self.layer.masksToBounds = false
        
    }
    
    
    //MARK: CUstom methods
    func configCell(data: StudentModel){
        lblName.text = data.name
        if let imgStr = data.img{
            if let urlStr = URL(string: imgStr){
                imageView.load(url:urlStr)
            }
            
        }
    }
}

