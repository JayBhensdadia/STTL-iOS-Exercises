//
//  DynamicVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 19/04/24.
//

import UIKit

class DynamicVC: UIViewController {

    @IBOutlet var viewTable: UITableView!
    
    var dataSourceDelegate: DynamicDataSourceDelegate!
    
    var arrData = [
        Todo(title: "go to gym", isEditing: false),
        Todo(title: "Enter Title", isEditing: true)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        hideKeyboardWhenTappedAround()
    }
    

    func setUpTable(){
        if dataSourceDelegate == nil {
            dataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: viewTable)
        }
    }
}
extension DynamicVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}
