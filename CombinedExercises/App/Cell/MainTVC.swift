//
//  MainTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//

import UIKit

class MainTVC: UITableViewCell {
    
    
    //MARK: outlets
    @IBOutlet var viewMain: UIView!
    
    @IBOutlet var lblLogo: UILabel!
    @IBOutlet var viewLogo: UIView!
    @IBOutlet var lblTitle: UILabel!
    
    
    
    //MARK: lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        viewLogo.layer.cornerRadius = viewLogo.frame.height / 3
        viewLogo.layer.masksToBounds = true
        
        
        // Set the background image for the view
        let backgroundImage = UIImage(named: "bg")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = viewMain.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewMain.addSubview(backgroundImageView)
        viewMain.sendSubviewToBack(backgroundImageView)
        
        // Customize the labels
        viewMain.layer.borderWidth = 1
        viewMain.layer.borderColor = UIColor.systemBrown.cgColor
        viewMain.layer.cornerRadius = 20
        viewMain.layer.masksToBounds = true
        
        
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
    //MARK: cutom methods
    
    func configCell(data: String, index:Int){
        lblTitle.text = data
        lblLogo.text = String(index + 1)
    }
    
    
    
}
