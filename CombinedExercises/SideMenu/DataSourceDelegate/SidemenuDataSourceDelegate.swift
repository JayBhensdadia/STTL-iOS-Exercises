//
//  SideMenuDataSourceDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 23/04/24.
//


import UIKit
class SidemenuDataSourceDelegate : NSObject {
    
    typealias tblview = UITableView
    typealias delegate = TblViewDelegate
    
    var arr : [SideMenuModel]
    var tblv  : tblview
    var del : delegate
    fileprivate var selectedSection: IndexPath?
    var tblViewDataSourceDelegate:SidemenuDataSourceDelegate?
 
    
    init( arr:[SideMenuModel],tblv : tblview , del : delegate){
        self.arr = arr
        self.tblv = tblv
        self.del = del
        super.init()
        setupTableView()
    }
    
    func reload(arr : [SideMenuModel] , selectedSection : IndexPath) {
        self.arr = arr
        self.selectedSection = selectedSection
        tblv.reloadData()
    }
    
    
    
    fileprivate func setupTableView(){
        let nib = UINib(nibName: "SidemenuTVC", bundle: nil)
        tblv.register(nib, forCellReuseIdentifier: "SidemenuTVC")
        tblv.delegate = self
        tblv.dataSource = self
    }
}

extension SidemenuDataSourceDelegate : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        del.didselect(tbl: tblv, indexPath: indexPath)
    }
}
extension SidemenuDataSourceDelegate :UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aMenuOptionData = arr[indexPath.row]
        let aMenuItenCell = tableView.dequeueReusableCell(withIdentifier: "SidemenuTVC", for: indexPath) as! SidemenuTVC
        aMenuItenCell.configCell(data: aMenuOptionData)
//        if arr.count-1 == indexPath.row {
//            aMenuItenCell.sepView.isHidden = true
//        }
        
        return aMenuItenCell
    }
}


