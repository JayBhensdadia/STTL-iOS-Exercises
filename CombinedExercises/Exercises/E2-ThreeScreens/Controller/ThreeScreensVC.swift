//
//  ThreeScreensVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit

class ThreeScreensVC: UITableViewController {
    //MARK: variables
    let pages = ["Screen1","Screen2", "Screen3"]

    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Three Screens"

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscreen", for: indexPath)
        
        cell.textLabel?.text = pages[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: pages[indexPath.row], bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: pages[indexPath.row]) as! UIViewController
        navigationController?.pushViewController(vc, animated: true)
    }

}
