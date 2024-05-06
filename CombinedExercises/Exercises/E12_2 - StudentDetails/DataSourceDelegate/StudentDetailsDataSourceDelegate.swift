//
//  StudentDetailsDataSourceDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 29/04/24.
//




import Foundation

import UIKit

class TblModel{
    var title:String
    var value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
}

class StudentDetailsDataSourceDelegate: NSObject {
    
    typealias T = TblModel
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
        let nib = UINib(nibName: "StudentDetailsTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "StudentDetailsTVC")
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

extension StudentDetailsDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
   
}
extension StudentDetailsDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "StudentDetailsTVC", for: indexPath)as! StudentDetailsTVC
        cell.configCell(title: arrSource[indexPath.row].title, value: arrSource[indexPath.row].value)
        return cell
    }
}

