//
//  SimpleTVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 15/04/24.
//

import UIKit

class SimpleTVC: UIViewController {

    
    //MARK: outlets
    
    @IBOutlet var viewTable: UITableView!
    
    
    //MARK: variables
    var contacts = [
        "A":["Ajay","Akash"],
        "B":["Binod","Brijesh"]
    ]
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTable.dataSource = self
        viewTable.delegate = self
    }
    
}

//implementing UITableDataSource protocol
extension SimpleTVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(contacts.values)[section].count
    }
}


//implementing UITableViewDelegate protocol
extension SimpleTVC: UITableViewDelegate{
    
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(contacts.keys)[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Array(contacts.values)[indexPath.section][indexPath.row]
        return cell
    }
}

