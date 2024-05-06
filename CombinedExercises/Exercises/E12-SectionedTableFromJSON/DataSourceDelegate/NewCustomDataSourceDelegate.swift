//
//  NewCustomDataSourceDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 17/04/24.
//


import UIKit

class NewCustomDataSourceDelegate: NSObject {
    
    typealias T = StudentModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    //dictionary used to implement sections in table view
    var dict = [String: [T]]()
    
    
    //variables used to filter the arrSource
    var isSearched = false
    var filteredArr = [T]()
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl ) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
//        filterData(query: query)
        setUpDict()
    }
    
    
    
    //filterData according to search query
    func filterData(query: String){
        
        filteredArr.removeAll()
        if !query.isEmpty{
            
            filteredArr = arrSource.filter({ student in
                return student.name.lowercased().contains(query.lowercased())
            })
            
        }else{
            filteredArr = arrSource
        }
        
        print(filteredArr)
        isSearched = true
        reload(arr: filteredArr)
        
    }
    
    
    
    // create dictionary out of source array
    func setUpDict(){
        dict.removeAll()
                
        for student in (filteredArr.isEmpty ? ( isSearched ? filteredArr : arrSource): filteredArr){
            let char = String(student.name[student.name.startIndex])
            if dict[char] == nil{
                dict[char] = [student]
            }else{
                
                dict[char]?.append(student)
                
            }
        }
        
        print(dict)
    }
    
    
    // register cell nib and delegates
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "SectionedTVCell", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "SectionedTVCell")
//        tblvw.register(cellType: CustomTVC.self)
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    
    //reload table after filtering
    func reload(arr:[T ]){
        setUpDict()
        isSearched = false
        tblvw.reloadData()
        
    }
    
    
}


//implementing UITableViewDelegate protocol
extension NewCustomDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sortedKeys = Array(dict.keys).sorted()
        return sortedKeys[section]
    }
}

//implementing UITableViewDataSource protocol
extension NewCustomDataSourceDelegate:UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dict.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let sortedValues = Array(dict.values).sorted { arr1, arr2 in
            arr1[0].name < arr2[0].name
        }
        return sortedValues[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sortedValues = Array(dict.values).sorted { arr1, arr2 in
            arr1[0].name < arr2[0].name
        }
        
        let cell = tblvw.dequeueReusableCell(withIdentifier: "SectionedTVCell", for: indexPath)as! SectionedTVCell
        cell.configCell(data: sortedValues[indexPath.section][indexPath.row])
        return cell
    }
}


