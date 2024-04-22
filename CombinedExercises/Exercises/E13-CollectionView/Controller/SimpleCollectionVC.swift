//
//  SimpleCollectionVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//

import UIKit

class SimpleCollectionVC: UIViewController {

    
    //MARK: outlets
    @IBOutlet var viewCollection: UICollectionView!
    
    
    //MARK: variables
    var dataSourceDelegate: CollectionDataSourceDelegate!
    
    var items = Array(0...100)
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    //MARK: custom functions
    func setupCollection() {
        if dataSourceDelegate == nil {
            dataSourceDelegate = .init(arrData: items, delegate: self, col: viewCollection,vc:self)
        } else {
            dataSourceDelegate.reload(arr: items)
        }
    }
    
}

//implementing to ColViewDelegate protocol
extension SimpleCollectionVC: ColViewDelegate{
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        
    }
}
