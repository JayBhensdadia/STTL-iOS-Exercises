//
//  SectionedTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 17/04/24.
//

import UIKit

class SectionedTVC: UIViewController {
    
    //MARK: outlets

    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var txtSearchBar: UISearchBar!
    
    
    //MARK: variables
    var webService = StudentWebService()
    var newCustomDataSourceDelegate: NewCustomDataSourceDelegate!
    var arrData = [StudentModel]()
    
    
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearchBar.delegate = self
        getData()
    }
    
    
    //MARK: custom methods
    func getData(){
        webService.getStudentList { arr in
            arrData = arr
        }
        setupTblView()
    }

    func setupTblView(){
        if newCustomDataSourceDelegate == nil {
            newCustomDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tableView)
        }
    }

}

//implementing TbleViewDelegate protocol
extension SectionedTVC : TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}

//implementing UISearchBarDelegate protocol
extension SectionedTVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching....")
        self.newCustomDataSourceDelegate.filterData(query: searchText)
    }
}
