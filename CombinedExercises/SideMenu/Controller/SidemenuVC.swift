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
    
    var hasContentSizeObserver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.isScrollEnabled = false
//        tblView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        addContentSizeObserver()
        
        setUpTblView()
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 50
//        tblViewHeight.constant = CGFloat(arrSideMenu.count * 40)
        
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
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (object as! UITableView) == self.tblView{
            if(keyPath == "contentSize"){
                if let newvalue = change?[.newKey]{
                    let newsize = newvalue as! CGSize
                    print(newsize.height)
                    tblViewHeight.constant = newsize.height
                    
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeContentSizeObserver()
    }
    
    func setUpTblView(){
        if let arr = readPropertyList(ofName: "SideMenu") as? [[String:Any]] {
            self.arrSideMenu = arr.map({ SideMenuModel(dict: $0) })
        }
        if sidemenuDataSourceDelegate == nil {
            sidemenuDataSourceDelegate = .init(arr: arrSideMenu, tblv: tblView, del: self)
        }
    }
    
    
    deinit {
            removeContentSizeObserver() // Ensure the observer is removed
        }

        func addContentSizeObserver() {
            if !hasContentSizeObserver {
                tblView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
                hasContentSizeObserver = true
            }
        }

        func removeContentSizeObserver() {
            if hasContentSizeObserver {
                tblView.removeObserver(self, forKeyPath: "contentSize")
                hasContentSizeObserver = false
            }
        }
    
    
    
    @IBAction func btnLogoutAction(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        
//        let storyboard = UIStoryboard(name: "LoginScreen2", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "LoginScreen2") as! UIViewController
//        navigationController?.pushViewController(vc, animated: true)
    }
    

}
extension SidemenuVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let story = UIStoryboard(name: arrSideMenu[indexPath.row].storyboardID, bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: arrSideMenu[indexPath.row].storyboardID)as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    
}
