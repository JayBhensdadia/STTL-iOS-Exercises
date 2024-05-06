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
        
        var sortedData = arrData.sorted { student1, student2 in
            return student1.name < student2.name
        }
        
        for std in sortedData{
            print(std.name ?? "")
        }
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
        
        
        let story = UIStoryboard(name: "StudentDetails", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "StudentDetails")as! StudentDetailsVC
        
        
        let sortedValues = Array(newCustomDataSourceDelegate.dict.values).sorted { arr1, arr2 in
            arr1[0].name < arr2[0].name
        }
        
        vc.student = sortedValues[indexPath.section][indexPath.row]
        print("name --------- \(vc.student?.name ?? "")")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

//implementing UISearchBarDelegate protocol
extension SectionedTVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching....")
        self.newCustomDataSourceDelegate.filterData(query: searchText)
    }
}
