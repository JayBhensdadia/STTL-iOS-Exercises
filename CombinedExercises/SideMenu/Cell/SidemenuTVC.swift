//
//  SidemenuTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 23/04/24.
//

import UIKit

class SidemenuTVC: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func configCell(data: SideMenuModel){
//        print(data.Image)
        imgView.image = UIImage(named: data.Image)
        lblTitle.text = data.TitleKey
    }
}
