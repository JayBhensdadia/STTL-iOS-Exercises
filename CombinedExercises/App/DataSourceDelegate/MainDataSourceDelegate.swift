//
//  MainDataSourceDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 18/04/24.
//

import Foundation

import UIKit

class MainDataSourceDelegate: NSObject {
    
    typealias T = String
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "MainTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "MainTVC")
//        tblvw.register(cellType: CustomTVC.self)
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[T ]){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
    
}


//implementing UITableViewDelegate protocol
extension MainDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
    
    
   
}

//implementing UITableDataSource protocol
extension MainDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "MainTVC", for: indexPath)as! MainTVC
        cell.configCell(data: arrSource[indexPath.row], index: indexPath.row)
        return cell
    }
    
    
}

