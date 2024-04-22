//
//  DynamicTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 19/04/24.
//

import UIKit

class DynamicTVC: UITableViewCell {

    
    @IBOutlet var label: UILabel!
    
    
    @IBOutlet var txtTitle: UITextField!
    
    @IBOutlet var btnAdd: UIButton!
    
    @IBOutlet var btnDelete: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func configCell(data: Todo){
        
        label.text = data.title
        if data.isEditing{
            label.isHidden = true
            btnDelete.isHidden = true
        }else{
            txtTitle.isHidden = true
            btnAdd.isHidden = true
        }
        
    }
    
}
