//
//  SimpleCVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//

import UIKit

class SimpleCVC: UICollectionViewCell {

    //MARK: outlets
    @IBOutlet var label: UILabel!
    
    //MARK: lifecyle methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: custom methods
    func configCell(data: String){
        label.text = data
    }
}
