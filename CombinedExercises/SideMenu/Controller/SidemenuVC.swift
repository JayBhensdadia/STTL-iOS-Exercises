//
//  SidemenuVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 23/04/24.
//

import UIKit

class SidemenuVC: UIViewController {

    @IBOutlet var imgView: UIView!
    
    @IBOutlet var tblViewHeight: NSLayoutConstraint!
    @IBOutlet var tblView: UITableView!
    var arrSideMenu : [SideMenuModel] = []
    var sidemenuDataSourceDelegate : SidemenuDataSourceDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.isScrollEnabled = false
        
        setUpTblView()
        tblViewHeight.constant = CGFloat(arrSideMenu.count * 40)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.imgView.layer.cornerRadius = self.imgView.frame.height/2
            self.imgView.layer.masksToBounds = true
        })
    }
    

    func readPropertyList(ofName: String) -> Any? {
        if let path = Bundle.main.path(forResource: ofName, ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .init(rawValue: 0))
                let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                return plistData
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
    
    func setUpTblView(){
        if let arr = readPropertyList(ofName: "SideMenu") as? [[String:Any]] {
            self.arrSideMenu = arr.map({ SideMenuModel(dict: $0) })
        }
        if sidemenuDataSourceDelegate == nil {
            sidemenuDataSourceDelegate = .init(arr: arrSideMenu, tblv: tblView, del: self)
        }
    }
    

}
extension SidemenuVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let story = UIStoryboard(name: arrSideMenu[indexPath.row].storyboardID, bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: arrSideMenu[indexPath.row].storyboardID)as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
