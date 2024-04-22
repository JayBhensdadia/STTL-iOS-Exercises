//
//  CustomizedTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 16/04/24.
//

import UIKit


class MyData {
    var name: String
    var dob: String
    var department:String
    var logoTitle: Character
    
    init(name: String, dob: String, department: String) {
        self.name = name
        self.dob = dob
        self.department = department
        self.logoTitle = name[name.startIndex]
    }
}


class CustomizedTVC: UIViewController {
    
    
    //MARK: outlets
    
    @IBOutlet var viewTable: UITableView!
    
    
    
    //MARK: variables
    
    var data = [
        MyData(name: "Atharv Pandit", dob: "01-01-2000", department: "ios"),
        MyData(name: "Kashayp Patel", dob: "01-02-2000", department: "ios")
    ]
   
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CustomCellVC", bundle: nil)
        viewTable.register(nib, forCellReuseIdentifier: "CustomCellVC")
        viewTable.dataSource = self
        viewTable.delegate = self
    }
    
}

//implementing UITableDataSource protocol
extension CustomizedTVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

//implementing UITableViewDelegate protocol
extension CustomizedTVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellVC", for: indexPath) as! CustomCellVC
        
        cell.txtName.text = data[indexPath.row].name
        cell.txtDate.text = data[indexPath.row].dob
        cell.txtDepartment.text = data[indexPath.row].department
        cell.txtLogo.text = String(data[indexPath.row].logoTitle)
        
        return cell
    }
}
