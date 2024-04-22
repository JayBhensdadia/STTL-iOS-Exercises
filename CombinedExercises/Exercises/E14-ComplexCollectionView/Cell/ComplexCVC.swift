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
        
        viewShadow.layer.shadowColor = UIColor.systemGray3.cgColor
        viewShadow.layer.shadowOffset = .zero
        viewShadow.layer.shadowOpacity = 0.6
        viewShadow.layer.shadowRadius = 10.0
        viewShadow.layer.shadowPath = UIBezierPath(rect: viewShadow.bounds).cgPath
        viewShadow.layer.shouldRasterize = true
        
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

