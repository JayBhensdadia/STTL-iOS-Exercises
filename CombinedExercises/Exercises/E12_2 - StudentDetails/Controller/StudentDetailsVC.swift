//
//  StudentDetailsVC.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 29/04/24.
//

import UIKit

class StudentDetailsVC: UIViewController {

    
    
    @IBOutlet var shadowView: UIView!
    
    
    
    @IBOutlet var detailsView: UIView!
    
    
    @IBOutlet var logoView: UIView!
    
    
    @IBOutlet var imgView: UIImageView!
    
    
    
    @IBOutlet var lblName: UILabel!
    
    
    
    @IBOutlet var lblDepartment: UILabel!
    
    
    
    @IBOutlet var lblStudentId: UILabel!
    
    
    
    @IBOutlet var lblSportsName: UILabel!
    
    
    @IBOutlet var tblView: UITableView!
    
    
    
    @IBOutlet var orangeView: UIView!
    
    var webService = StudentWebService()
    var studentDetailsDataSourceDelegate: StudentDetailsDataSourceDelegate!
    
    
    var student: StudentModel?
//    var arrData:Array<Dictionary<String, String>>?
//    var arrData:[TblModel]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnTap = true
        navigationItem.hidesBackButton = true
        tblView.showsVerticalScrollIndicator = false
        setupTblView()
        
    
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.logoView.layer.cornerRadius = self.logoView.frame.height/2
            self.logoView.layer.borderWidth = 1
            self.logoView.layer.borderColor = UIColor.red.cgColor
            self.logoView.layer.masksToBounds = true
        })
        
//        detailsView.layer.borderWidth = 1
//        detailsView.layer.cornerRadius = 20
        
        
        orangeView.layer.cornerRadius = 10
        orangeView.layer.masksToBounds = true
//        detailsView.layer.masksToBounds = true
        
        
        shadowView.layer.borderWidth = 1
        shadowView.layer.cornerRadius = 10
        shadowView.layer.borderColor = UIColor.systemGray5.cgColor
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 0, height: -3)
        shadowView.layer.shadowRadius = 4
        shadowView.layer.masksToBounds = false
        

        
    }


    func setupTblView(){
        
        if let student = student{
//            imgView.load(url: student.img)
            lblName.text = student.name
            lblDepartment.text = student.department
            lblStudentId.text = String(student.studentId ?? 0)
            lblSportsName.text = student.sportsName ?? "unknown"
            
            if let imgStr = student.img{
                if let urlStr = URL(string: imgStr){
                    imgView.load(url:urlStr)
                }
                
            }
            let arrData:[TblModel] = [
                TblModel(title: "DOB", value: student.dob),
                TblModel(title: "Student Id", value: String(student.studentId ?? 0)),
                TblModel(title: "Gender", value: String(student.gender ?? "unknown")),
                TblModel(title: "Sem One Grade", value: String(student.semOneGrade ?? 0.0)),
                TblModel(title: "Sem Two Grade", value: String(student.semOneGrade ?? 0.0)),
                TblModel(title: "Sem Three Grade", value: String(student.semTwoGrade ?? 0.0)),
                TblModel(title: "Sem Four Grade", value: String(student.semThreeGrade ?? 0.0)),
                TblModel(title: "Sem Five Grade", value: String(student.semFourGrade ?? 0.0)),
                TblModel(title: "Sem Six Grade", value: String(student.semFiveGrade ?? 0.0)),
                
            ]
            
            if studentDetailsDataSourceDelegate == nil {
                studentDetailsDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
            }
        }
        
        
    }

    
    
    @IBAction func btnBackAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
   

}


extension StudentDetailsVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}
