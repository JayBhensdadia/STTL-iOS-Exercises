//
//  ComplexCollectionVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//

import UIKit

class ComplexCollectionVC: UIViewController {

    //MARK: outlets
    @IBOutlet var viewCollection: UICollectionView!
    
    //MARK: variables
    var arrData = [StudentModel]()

    var dataSourceDelegate: ComplexDataSourceDelegate!
    var webService = StudentWebService()
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        if dataSourceDelegate == nil {
            dataSourceDelegate = .init(arrData: arrData, delegate: self, col: viewCollection, vc: self)
        }
    }

    

}


//implementing COlViewDelegate protocol
extension ComplexCollectionVC: ColViewDelegate{
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        
    }
}
