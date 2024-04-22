//
//  CollectionDataSourceDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//
import Foundation
import UIKit

protocol ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath)
}

class CollectionDataSourceDelegate: NSObject {
    
    typealias T = Int
    typealias col = UICollectionView
    typealias del = ColViewDelegate
    typealias vc = UIViewController
    
    internal var arrSource: [T]
    internal var colvw: col
    internal var delegate: del
    internal weak var vc:vc?
    
    let kNumberOfItemsInOneRow: CGFloat = 5
    let kEdgeInset:CGFloat = 10
    let minimumInterItemandLinespacing:CGFloat = 10
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: ColViewDelegate, col: UICollectionView,vc:vc) {
        arrSource = arrData
        colvw = col
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    fileprivate func setupCol(){
        
        let nib = UINib(nibName: "SimpleCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "SimpleCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    func reload(arr:[T]){
        arrSource = arr
        colvw.reloadData()
    }
}

extension CollectionDataSourceDelegate:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
    
}
extension CollectionDataSourceDelegate:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCVC", for: indexPath) as! SimpleCVC
        cell.configCell(data: String(arrSource[indexPath.row]))
        return cell
    }
}


//MARK:- UICollectionViewDelegateFlowLayout Methods
extension CollectionDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - minimumInterItemandLinespacing * (kNumberOfItemsInOneRow-1)) / (kNumberOfItemsInOneRow+1)
        let height = width
//
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}


