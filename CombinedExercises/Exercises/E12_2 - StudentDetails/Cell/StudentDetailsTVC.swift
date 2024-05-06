//
//  StudentDetailsTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 29/04/24.
//

import UIKit

class StudentDetailsTVC: UITableViewCell {

    
    
    @IBOutlet var lblTitle: UILabel!
    
    
    
    @IBOutlet var lblValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configCell(title: String, value: String){
        lblTitle.text = title
        lblValue.text = value
    }
    
    
}
