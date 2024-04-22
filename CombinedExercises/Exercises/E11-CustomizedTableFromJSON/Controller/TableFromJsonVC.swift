//
//  TableFromJsonVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 16/04/24.
//

import UIKit

class TableFromJsonVC: UIViewController {

    //MARK: outlets
    @IBOutlet var viewTable: UITableView!
    
    
    //MARK: variables
    var CustomDataSourceDelegate : CustomDataSourceDelegate!
    var webService = StudentWebService()
    
    var arrData : [StudentModel] = [
        StudentModel(fromDictionary: ["name":"Jay Bhensdadia","id":"01","img":"img-1","mark":100])
    ]
    
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTblView()
        
        getData()
        
    }
    
    
    //MARK: custom functions
    func getData(){
        webService.getStudentList { arr in
            arrData = arr
        }
        setupTblView()
    }

    func setupTblView(){
        if CustomDataSourceDelegate == nil {
            CustomDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: viewTable)
        }
    }
}


//implementing to TblViewDelegate protocol
extension TableFromJsonVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
//        print(arrData[indexPath.row].name)
    }
    
    
}
