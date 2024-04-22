//
//  ViewController.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var viewTable: UITableView!
    let pages = ["Helloworld","ThreeScreens","ColourChange","StackExample","LoginScreen","LoginScreen2","NewsOnAir","SimpleTable","CountryTable","CustomizedTable","TableFromJson","SectionedTable","SimpleCollectionView","ComplexCollectionView","Dynamic"]
    

    //MARK: variables
    var dataSourceDelegate: MainDataSourceDelegate!
    
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
    
        
    }

    
    //MARK: methods
    func setupTblView(){
        if dataSourceDelegate == nil {
            dataSourceDelegate = .init(arrData: pages, delegate: self, tbl: viewTable)
        }
    }
    
}

//MARK: extensions
extension ViewController: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: pages[indexPath.row], bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: pages[indexPath.row]) as! UIViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
    


/**
 
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return pages.count
 }
 
 
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "exercise", for: indexPath)
     
     cell.textLabel?.text = pages[indexPath.row]
     return cell
 }

 
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     let storyboard = UIStoryboard(name: pages[indexPath.row], bundle: nil)
     let vc = storyboard.instantiateViewController(withIdentifier: pages[indexPath.row]) as! UIViewController
     navigationController?.pushViewController(vc, animated: true)
 }
 
 
 */
